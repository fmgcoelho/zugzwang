#const moves = 15.

peg(a ; b ; c).
disk(1..4).
init_on(1..4, a).
goal_on(1..4, c).

%*
    Implicit relative locations on a peg.
    In a peg, disk are placed top-down from the largest to the smallest.
*%
