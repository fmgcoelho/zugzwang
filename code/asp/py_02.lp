#script (python)

def main(prg):
    p = []
    p.append(("base", []))
    p.append(("a", [1, 3]))
    prg.ground(p)
    prg.solve()

#end.

a.
#program a(s,t).
b(s,t).
#program base.
c.