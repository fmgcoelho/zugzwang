#script (python)

import clingo

N = clingo.Number

def gcd(a, b):
    if a.number == 0:
        return b
    else:
        na = a.number
        nb = b.number
        nc = N(nb % na)
        return gcd(nc, a)

#end.

p(210, 213).
p(1364, 385).
gcd(X, Y, @gcd(X,Y)) :- p(X, Y).

#show gcd/3.