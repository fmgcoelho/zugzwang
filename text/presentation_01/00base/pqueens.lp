% Column and row domains.
col(1 .. n).
row(1 .. n).

% One queen on some row per colum.
1 { queen(I, J) : row(J) } 1 :- col(I).

% One queen on some columns per row.
1 { queen(I, J) : col(I) } 1 :- row(J).

% Number descending diagonals.
diag1(I, J, I - J + n) :- col(I), row(J).
% Number ascending diagonals.
diag2(I, J, I + J - 1) :- col(I), row(J).
%
% Negative Restrictions
:- D = 1 .. 2 * n - 1, not { queen(I, J) : diag1(I, J, D) } 1.
:- D = 1 .. 2 * n - 1, not { queen(I, J) : diag2(I, J, D) } 1.
%
% Output this predicate.
#show queen/2.