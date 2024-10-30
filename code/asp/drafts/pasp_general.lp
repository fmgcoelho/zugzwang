% 0.6 :: edge(1, 2).
% 0.1 :: edge(1, 3).
% 0.4 :: edge(2, 5).
% 0.3 :: edge(2, 6).
% 0.3 :: edge(3, 4).
% 0.8 :: edge(4, 5).
% 0.2 :: edge(5, 6).
%
% =======================================
%   PARTICULAR INSTANCE
% =======================================
%
edge(1, 2).
edge(1, 3).
edge(2, 5).
edge(2, 6).
edge(3, 4).
edge(4, 5).
edge(5, 6).
%
% == HARD COLORING
%
red(1).
green(4).
green(6).
%
% =======================================
%   GENERAL DESCRIPTION
% =======================================
%
edge(X, Y) :- edge(Y, X).
%
node(X) :- edge(X, _) ; edge(_, X).
%
red(X); green(X); blue(X) :- node (X).
%
% == CONSTRAINTS
%
:- edge(X, Y), red(X), red(Y).
:- edge(X, Y), green(X), green(Y).
:- edge(X, Y), blue(X), blue(Y).
%
% =======================================
%   SOLVER DIRECTIVES
% =======================================
%
#show red/1.
#show green/1.
#show blue/1.