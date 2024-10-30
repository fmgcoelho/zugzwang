# Answer Set Programming

> **Answer set programming (ASP) is a form of declarative programming oriented towards difficult (primarily NP-hard) search problems.**
> 
> It is **based on the stable model (answer set) semantics** of logic programming. In ASP, search problems are reduced to computing stable models, and answer set solvers ---programs for generating stable models--- are used to perform search. 

---

**ASP** "programs" generates "deduction-minimal" models _aka_ **stable models** or **answer sets**.
- Given an ASP program $P$, a model $X$ of $P$ is a set where each element $x \in X$ has a proof using $P$. 
- In a "deduction-minimal" model $X$ each element $x \in X$ has a proof using $P$. Non-minimal models have elements without a proof.

## Key Questions

1. What is the relation between ASP and Prolog?
   1. **Prolog** performs **top-down query evaluation**. Solutions are extracted from the instantiation of variables of successful queries.
   2. **ASP** proceeds in two steps: first, **grounding** generates a (finite) _propositional representation of the program_; second, **solving** computes the _stable models_ of that representation.
2. What are the roles of **grounding** with `gringo` and **solving** with `clasp`?
3. Can ASP be used to **pLP**?
   1. What are the key probabilistic tasks/questions/problems?
   2. Where does distribution semantics enters? What about **pILP**?
4. Can the probabilistic task control the grounding (`gringo`) or solving (`clasp`) steps in ASP? 
5. Can ASP replace kanren?
   1. As much as ASP can replace Prolog.   

## Formal Foundations

### Common Concepts and Notation

 context | true, false | if | and | or | iff | default negation | classical negation
---------|------------|----|-----|----|-----|------|-----
source   |            | `:-` | `,` | `|` |   | `not` | `-`
logic prog. |         | ←  | ,   | ;  |     |  ̃ | ¬
formula | ⊤, ⊥        | →  | ∧   | ∨  | ↔   | ̃  | ¬   

> - **default negation** or **negation as failure (naf)**, `not a` ($\sim a$), means "_no information about `a`_".
> - **classical negation** or **strong negation**, `-a` ($\neg a$), means "_positive information about `-a`_" ie "_negative information about `a`_". Likewise `a`: "_positive informations about `a`_".
> - The symbol `not` ($\sim$), is a new logical connective; `not a` ($\sim a$) is often read as "_it is not believed that `a` is true_" or "_there is no proof of `a`_". Note that this does not imply that `a` is believed to be false.

- **Interpretation.** A _boolean_ interpretation is a function from ground atoms to **⊤** and **⊥**. It is represented by the atoms mapped to **⊤**.
  - if u, v are two interpretations **u ≤ v** iff u ⊆ v under this representation. 
  - **partial interpretations** are represented by ( {true atoms}, {false atoms}) leaving the undefined atoms implicit.
  - an **ordered boolean assignment** $a$ over $dom(a)$ in represented by a sequence $a = (V_ix_i | i \in 1:n)$ where $V_i$ is either $\top$ or $\bot$ and each $x_i\in dom(a)$.
    - $a^\top \subseteq a$ such that $\top x \in a$; $a^\bot \subseteq a$ such that $\bot x \in a$.
    - An ordered assignment $(a^\top, a^\bot)$ is a partial boolean interpretation.
- Subsets have a partial order for the $\subset$ relation; remember maximal and minimal elements.
- Directed graphs; Path; **Strongly connected** iff all vertex pairs (a,b) are connected; The **strongly connected components** are the strongly connected subgraphs.

### Basic ASP syntax and semantics

- A **definite clause** is, by definition, $a_0 \vee \neg a_1 \vee \cdots \vee \neg a_n$, a disjunction with exactly one positive atom.
   - Also denoted $a_0 \leftarrow a_1 \wedge \cdots \wedge a_n$.
   - **A set of definite clauses has exactly one smallest model.**
- A **horn clause** has at most one positive atom.
  - A horn clause without positive atom is an _integrity_ constraint - _a conjunction that **can't** hold_.
  - **A set of horn clauses has one or zero smallest models.**
- If $P$ is a **positive program**:
  - A set $X$ is **closed** under $P$ if $head(r) \in X$ if $body^+(r) \subset X$.  
  - $Cn(P)$ is, by definition, the set of **consequences of $P$**.
  - $Cn(P)$ is the smallest set closed under $P$.
  - $Cn(P)$ is the $\subseteq$-smallest model of $P$.
  - The **stable model** of $P$ is, by definition, $Cn(P)$.
  - If $P$ is a positive program, $Cn(P)$ is the smallest model of the definite clauses of $P$.

#### Example calculation of stable models

Consider the program P:
```prolog
person(joey).
male(X); female(X) :- person(X).
bachelor(X) :- male(X), not married(X).
```

1. Any SM of P must have the **fact** `person(joey)`.
2. Therefore the **grounded rule** `male(joey) ; female(joey) :- person(joey).` entails that the SMs of P either have `male(joey)` or `female(joey)`.
3. Any **SM must contain** either A: `{person(joey), male(joey)}` or B: `{person(joey), female(joey)}`.
4. In **the reduct** of P in A we get the rule `bachelor(joey) :- male(joey).` and therefore `bachelor(joey)` must be in a SM that contains A. Let A1:  `{person(joey), male(joey), bachelor(joey)}`.
5. No further conclusions result from P on A1. Therefore A1 is a SM.
6. Also no further conclusions result from P on B; It is also a SM.
7. The SMs of P are:
   1. `{person(joey), male(joey), bachelor(joey)}`
   2. `{person(joey), female(joey)}`


```prolog
-a.
not a.
%
% { -a }
%
-a.
a.
%
%  UNSAT.
%
not a.
a.
%
%  UNSAT
%
%----------------------------------------
%
a.
%% Answer: 1
%% a
%% SATISFIABLE
%
% There is (only) one (stable) model: {a}
%
%----------------------------------------
%
-a.
%% Answer: 1
%% -a
%% SATISFIABLE
%
% Same as above.
%
%----------------------------------------
%
--a. 
%% *** ERROR: (clingo): parsing failed
%
% WTF?
%
%----------------------------------------
%
not a.
%% Answer: 1
%% 
%% SATISFIABLE
%
% ie there is (only) one (stable) model: {} 
%
% This program states that there is no information. 
% In particular, there is no information about a.
% Therefore there are no provable atoms.
% Hence the empty set is a stable model.
%
%----------------------------------------
%
not not a.
%% UNSATISFIABLE
%
% ie no models. Because
%  1. No model can contain ~p.
%  2. Any model contains all the facts.
%  3. Suppose X is a model.
%  4. Since ~~a is a fact, by 2, ~~a ∈ X. 
%  5. But, by 1, ~~a ∉ X.
%  6. Therefore there are no models.  
%
%----------------------------------------
%
not -a.
%% Answer: 1
%% 
%% SATISFIABLE
%
% Same as ~a.
%
%----------------------------------------
%
b.
a;-a.
not a :- b.
% Answer: 1
% b -a
% SATISFIABLE
%
%  1. Any model must contain b (fact b).
%  2. Any models entails ~a (rule not a :- b.).
%  3. Any model must contain one of a or ¬a (rule a;-a).
%  4. No model can contain both a and ~a.
%  5. Therefore any model must contain {b, ¬a}, which is stable. 
%
%  Q: Why ~a does not contradicts -a
%  A: Not sure. Maybe because "~a" states that no model can contain a but says nothing about ¬a.
%
%----------------------------------------
%
b.
a;c.
% Answer: 1
% b c
% Answer: 2
% b a
% SATISFIABLE
%
%  1. Any model must have b.
%  2. Any model must have one of a or c.
%  3. No model with both a and c is minimal because either one satisfies a;c
```

- Why is the double strong negation, `--a`, a syntax error but the double naf, `not not a` is not? 

#### Definitions and basic propositions
1. Let $\cal{A}$ be a **set of ground atoms**.
2. A **normal rule** $r$ has the form $a \leftarrow b_1, \ldots, b_m, \sim c_1, \ldots, \sim c_n$ with $0 \leq m \leq n$.
   - _Intuitively,_ the head $a$ is true if **each one of the $b_i$ has a proof** and **none of the $c_j$ has a proof**.
3. A **program** is a finite set of rules.
4. The **head** of the rule is $\text{head}(r) = a$; The **body** is $\text{body}(r) = \left\lbrace b_1, \ldots, b_m, \sim c_1, \ldots, \sim c_n \right\rbrace$.
5. A **fact** is a rule with empty body and is simply denoted $a$.
6. A **literal** is an atom $a$ or the default negation $\sim a$ of an atom.
7. Let $X$ be a set of literals. $X^+ = X \cap \cal{A}$ and the  $X^- = \left\lbrace p\middle| \sim p \in X\right\rbrace$.
9.  The set of atoms that occur in program $P$ is denoted $\text{atom}(P)$. Also $\text{body}(P) = \left\lbrace \text{body}(r)~\middle|~r \in P\right\rbrace$. At last, $\text{body}_P(a) = \left\lbrace \text{body}(r)~\middle|~r \in P \wedge \text{head}(r) = a\right\rbrace$.
10. A **model** of the program $P$ is a set of ground atoms $X \subseteq \cal{A}$ such that, for each rule $r \in P$, $$\text{body}^+(r) \subseteq X \wedge \text{body}^-(r) \cap X = \emptyset \to \text{head}(r) \in X.$$
8. A rule $r$ is **positive** if $\text{body}(r)^- = \emptyset$; A program is positive if all its rules are positive.
11. _A positive program has an unique $\subseteq$-minimal model._  **Is this the link to prolog?**
12. The **reduct** of a formula $f$ relative to $X$ is the formula $f^X$ that results from $f$ replacing each maximal sub-formula _not satisfied by $X$_ by $\bot$. 
13. The **reduct** of program $P$ relative to $X$ is $$P^X = \left\lbrace \text{head}(r) \leftarrow \text{body}^+(r) \middle| r \in P \wedge \text{body}^-(r) \cap X = \emptyset \right\rbrace.$$ Thus $P^X$ results from
    1. Remove every rule with a naf literal $\sim a$ where $a \in X$.
    2. Remove the naf literals of the remaining rules.
14. Since $P^X$ is a positive program, it has a unique $\subseteq$-minimal model.
15. $X$ is a **stable model** of $P$ if $X$ is the $\subseteq$-minimal model of $P^X$.
16. **Alternatively,** let ${\cal C}$ be the **consequence operator**, that yields the smallest model of a positive program. A **stable model** $X$ is a solution of $${\cal C}\left(P^X\right) = X.$$
    -  _negative literals must only be true, while positive ones must also be provable._
17. _A stable model is $\subseteq$-minimal but not the converse._
18. _A positive program has a unique stable model, its smallest model._
19. _If $X,Y$ are stable models of a normal program then $X \not\subset Y$._
20. _Also, $X \subseteq {\cal C}(P^X) \subseteq \text{head}(P^X)$._

## ASP Programming Strategies

- **Elimination of unnecessary combinatorics.** The number of grounded instances has an huge impact on performance. Rules can be used as "pre-computation" steps.
- **Boolean Constraint Solving.** This is at the core of the **solving** step, e.g. `clasp`. 

## ASP vs. Prolog

- The different number of stable models lies precisely at the core difference between Prolog and ASP. **In Prolog, the presence of programs with negation that do not have a unique stable model cause trouble and the SLDNF resolution does not terminate on them [17]**. However, ASP embraces the disparity of stable models and treats the stable models of the programs as solutions to a given search program (from [Prolog and Answer Set Programming: Languages in Logic Programming](https://silviacasacuberta.files.wordpress.com/2020/07/final_paper.pdf) )
- Prolog programs may not terminate (`p :- \+ p.`); ASP "programs" always terminate (`p :- not p.` has zero solutions).
- ASP doesn't allow function symbols; Prolog does.


## References

1. Martin Gebser, Roland Kaminski, Benjamin Kaufmann, Torsten Schaub - Answer Set Solving in Practice-Morgan & Claypool (2013)
2. [Potassco, clingo and gringo](https://potassco.org/): <https://potassco.org/
3. ["Answer Set Programming" lecture notes](http://web.stanford.edu/~vinayc/logicprogramming/html/answer_set_programming.html) for the Stanfords' course on Logic Programming by Vinay K. Chaudhri. Check also [the ILP section](http://web.stanford.edu/~vinayc/logicprogramming/html/inductive_logic_programming.html), this ASP example of an [encoding](http://www.stanford.edu/~vinayc/logicprogramming/epilog/jackal_encoding.lp) and related [instance](http://www.stanford.edu/~vinayc/logicprogramming/epilog/jackal_instance.lp) and [project suggestions](http://web.stanford.edu/~vinayc/logicprogramming/html/projects.html).