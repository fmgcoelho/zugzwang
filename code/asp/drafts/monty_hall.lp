prize(1, (1,3) ) ; prize(2, (1,3)) ; prize(3, (1, 3)).

selected(1).

open_door(2, (1,2)) ; open_door(3, (1,2)) :- prize(1, _).
open_door(2, (1,1)) :- prize(3, _).
open_door(3, (1,1)) :- prize(2, _).

win_keep :-
    prize(1, _),
    open_door(_, _).
win_switch :- 
    prize(2, _),
    open_door(3, _).
win_switch :- 
    prize(3, _),
    open_door(2, _).

% #show win_keep/1.
% #show win_switch/1.