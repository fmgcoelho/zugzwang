obs(a, c, 9, 1).
obs(c, b, 7, 3).
obs(d, c, 3, 2).
obs(d, b, 9, 1).

edge(A,B); -edge(A,B) :- obs(A, B, _, _).

prob(X,Y, P, P + N) :- edge(X,Y), obs(X,Y, P, N).
prob(X,Y, N, P + N) :- -edge(X,Y), obs(X,Y, P, N).

path(X,Y, 1) :- edge(X,Y).
path(X,Y, 2) :- edge(X,Z), path(Z, Y, _).

#show prob/4.
#show path/3.