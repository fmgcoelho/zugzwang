p(1;2).
q(1;2).
r(X,Y) :- p(X), q(Y), X != Y.

#show r/2.