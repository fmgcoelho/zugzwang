%   Generating
1 { move(D, P, T) : disk(D), peg(P) } 1 :- T = 1 .. moves.

%   Defining
move(D, T)                  :- move(D, _, T).   % when target peg is irrelevant
on(D, P, 0)                 :- init_on(D, P).                               % init
on(D, P, T)                 :- move(D, P, T).                               % effect: move
on(D, P, T + 1)             :- on(D, P, T), not move(D, T + 1), T < moves.  % inertia
blocked(D - 1, P, T + 1)    :- on(D, P, T), T < moves.      % D on P, T => P blocked to D - 1
blocked(D - 1, P, T)        :- blocked(D, P, T), disk(D).   % P blocked to D => P blocked D - 1

%   Testing
:- move(D, P, T), blocked(D - 1, P, T).
:- move(D, T), on(D, P, T - 1), blocked(D, P, T).
:- not 1 { on(D, P, T) } 1, disk(D), T = 1 .. moves.

:- goal_on(D, P), not on(D, P, moves).

%   Displaying
% #hide.
#show move/3.