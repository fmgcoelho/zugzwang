p(1).
p(2).
p(3).

q(3) :- not r(3).
r(X) :- p(X), not q(X).