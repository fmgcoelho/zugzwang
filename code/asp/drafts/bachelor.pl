person(joey).
% male(X); female(X) :- person(X).
male(X) :- person(X).
female(X) :- person(X).

bachelor(X) :- male(X), \+ married(X).