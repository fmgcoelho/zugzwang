person(joey).

married(X); -married(X) :- person(X).

male(X); female(X) :- person(X).

bachelor(X) :- male(X), not married(X).

#show bachelor/1. 