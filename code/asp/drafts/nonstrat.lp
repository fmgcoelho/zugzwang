-a ; a.             % c1
b :- not c, not a.  % c2
c :- not b.         % c3

prob_r(a, 3, 10).
prob_r(-A, C - B, C) :- prob_r(A, B, C).

