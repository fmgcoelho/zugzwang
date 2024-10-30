shaves(X, Y) :- barber(X), villager(Y), not shaves(Y, Y).

villager(a).
barber(b).

villager(b) ; -villager(b).

query :- not shaves(b, b).