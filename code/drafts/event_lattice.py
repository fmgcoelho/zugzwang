import math
from functools import cache
from itertools import accumulate, combinations, chain, groupby
import operator


    
def uniform_op(x):
    n = len(list(x))
    return 1.0 if n == 0 else 1.0/n


def max_op(x):
    return max(x)


def min_op(x):
    return min(x)


def sum_op(x):
    return sum(x)


def stableprod_op(x):
    log_x = map(math.log, x)
    return math.exp(sum(log_x))


def prod_op(x):
    return list(accumulate(x, func=lambda a,b: a*b))[-1]


class Event:
    """Events.
     
    An event is a set of literals - atoms and negated atoms.

    The convention is that atoms are represented by lower case single letters
    and a negated atom by upper case single letters.
    """

    @staticmethod
    def _parse(text):
        return frozenset(text)

    @staticmethod
    def parse(text):
        """Convert a string to an event.

        Each letter in the string represents a literal.
        """
        return Event(Event._parse(text))


    def __init__(self, literals):
        """Instantiate from a (frozen) set of literals.
        For example: e = Event(frozenset("abc"))."""
        self._literals = frozenset(literals)


    def literals(self):
        return self._literals


    def __iter__(self):
        return self._literals.__iter__()
    
    @cache
    def is_consistent(self):
        """True if this event is consistent."""
        return all(x.swapcase() not in self._literals for x in self._literals)


    def co(self):
        """Negation of this event.
        
        Negation is case based: A = not a; a = not A."""
        return Event(x.swapcase() for x in self._literals)

    def invert(self):
        """Negation of this event.

        See the method "co"
        """
        return self.co()

    def __repr__(self) -> str:
        return ''.join(str(x) for x in sorted(self._literals)) if len(self._literals) > 0 else '0'

    def latex(self):
        """LaTeX representation of this even.
        
        Negation is represented by overline and the empty event by 

        """
        return ''.join(
            (str(x) if x.islower() else f"\co{{{x.lower()}}}") \
                for x in sorted(self._literals)
            ) if len(self._literals) > 0 else "\set{}"

    def __hash__(self) -> int:
        return self._literals.__hash__()


    def __eq__(self, other):
        """Event equality test."""
        return self._literals.__eq__(other._literals)

    def __or__(self, other):
        """Event union operation."""
        return Event(self._literals | other._literals)

    def __le__(self, other):
        """Event subset test."""
        return self._literals.__le__(other._literals)


    def __lt__(self, other):
        """Event strict subset test."""
        return self._literals.__lt__(other._literals)


    def __ne__(self, other):
        """Event not-equal test."""
        return self._literals.__ne__(other._literals)


    def __ge__(self, other):
        """Event superset test."""
        return self._literals.__ge__(other._literals)


    def __gt__(self, other):
        """Event strict superset test."""
        return self._literals.__gt__(other._literals)


class Lattice:

    @staticmethod
    def parse(d):
        """Input stable models.
        
        The input format is a dictionary associating a stable model in string form to an weight.
        
        For example:
        
        input_dict = {
            "A": 0.3,
            "ab": 0.2,
            "ac": 0.5
        }
        smodels = Lattice.parse(input_dict)
        """
        result = dict()
        for k, v in d.items():
            key = Event.parse(k)
            result[key] = v
        return result


    @staticmethod
    def close_literals(events):
        """Closed set of literals entailed by a set of events.
        
        Includes the literals in the set of events and any missing negation."""
        base_lits = list(accumulate(events, func=operator.or_))[-1]
        lits = set()
        for x in base_lits.literals():
            lits.add(x)
            lits.add(x.swapcase())
        return sorted(lits)

    def __init__(self, smodels_dict):
        """Create an Events lattice."""
        self._smodels = smodels_dict
        self._literals = Lattice.close_literals(self._smodels.keys())

    def literals(self):
        """The literals in this lattice."""
        return self._literals

    @cache
    def stable_models(self):
        """The stable models that generate this lattice."""
        return self._smodels.keys()

    #@cache
    def events(self):
        """All the events of this lattice."""
        return chain.from_iterable(map(Event, combinations(self._literals, r)) for r in range(len(self._literals)+1))

    @cache
    def stable_core(self, event):
        """The stable core of an event in this lattice."""
        return set(filter(lambda sm: sm <= event or event <= sm, self.stable_models()))

    # @cache
    # def event_class(self, event):
    #     """The equivalence class of an event."""
    #     return EventsClass(self.stable_core(event), self)

    @cache
    def classes(self):
        """The classes of this lattice.
        
        Each class is presented as a key:value pair where the "key" is the stable core of the elements in "value"."""
        map_ev_classes = [(e, tuple(self.stable_core(e))) for e in self.events() if e.is_consistent()]
        groups = dict()
        for e,c in map_ev_classes:
            if c in groups.keys():
                groups[c].add(e)
            else:
                groups[c] = set([e])
        inconsistent = list(e for e in self.events() if not e.is_consistent())
        inconsistent_repr = inconsistent[0]
        groups[(inconsistent_repr,)] = set(inconsistent)
        return groups


    def related(self, u, v):
        """Tests if two events are related."""
        u_consistent = u.is_consistent()
        v_consistent = v.is_consistent()
        if u_consistent and (u_consistent == v_consistent):
            return self.stable_core(u) == self.stable_core(v)
        else:
            return u_consistent == v_consistent

    def extended_value(self, event:Event, 
            op=prod_op):
        """TODO: well..."""
        value = 0
        #
        #   INCONSISTENT EVENTS
        #
        if not event.is_consistent():
            return value
        #
        #   CONSISTENT EVENTS
        #
        score = self.stable_core(event)
        len_score = len(score)
        #   CONSISTENT, INDEPENDENT
        if len_score == 0:
            value = 0
        elif len_score == 1:
            value = self._smodels[score[0]]
        else:
            value = op(map(lambda sm: self._smodels[sm], score))

        return value

    def __repr__(self):
        smodels_repr = ',\n\t\t'.join(f"{k}: {v:<}" for k,v in self._smodels.items())
        lits_repr = ','.join(sorted(self._literals))

        return "{\n" +\
            f"\t'stable_models': {{\n\t\t {smodels_repr} \n\t}}\n" +\
            f"\t'literals': {{ {lits_repr} }} \n" +\
            "}"

# class EventsClass:
#     def __init__(self, core, lattice:Lattice):
#         self._core = core
#         self._lattice = lattice

#     def __repr__(self):
#         core_repr = "" if len(self._core) == 0 else ",".join(str(x) for x in self._core)
#         return f"<{core_repr}>"

#     def __contains__(self, event:Event):
#         return self.lattice.stable_core(event) == self._core

if __name__ == "__main__":
    def zoom_event(event_str, lattice):
        event = Event.parse(event_str)
        event_class = lattice.event_class(event)
        propagated = lattice.extended_value(
            event)

        print(
            f"Event: {event}\n\tClass: {event_class} \n\tValue: {propagated}")

    smodels = Lattice.parse({
        "A": 2,
        "ab": 3,
        "ac": 5
    })

    lattice = Lattice(smodels)

    ev_classes = lattice.classes()
    for k,g in ev_classes.items():
        print(f"{tuple(s.latex() for s in k)} {set(e.latex() for e in g)}")
    # zoom_event("abc", lattice)
    # zoom_event("a", lattice)
    # zoom_event("b", lattice)
    # zoom_event("bc", lattice)
    # zoom_event("ac", lattice)