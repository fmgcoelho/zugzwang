from itertools import combinations, product

def fmt(expr):
    """Doc string"""
    return ",".join(f"{x:>2}" for x in expr)

def c(expr):
    """Doc string"""
    def litcomp(x):
        if x == "⊤":
            return "⊥"
        elif x == "⊥":
            return "⊤"
        elif x[0] == "¬":
            return x[1:]
        else:
            return f"¬{x}"
    return [litcomp(x) for x in expr]

def domain(symbols, unary="¬"):
    """Doc string"""
    atoms = list(symbols)
    literals = [
        [f"{u}{a}" for u in unary] +
        [a, "⊤", "⊥"] for a in atoms ]
    return product(*literals)

d = sorted(domain("abc"))
for x in d:
    print(f"{fmt(x)} | {fmt(c(x))}")
