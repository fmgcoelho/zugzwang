% p :- not p.   % UNSAT
% not p :- p.   % SAT: {}
% p :- -p.      % SAT: {}
% -p :- p.      % SAT: {}
% not p :- -p.  % SAT: {}
% -p :- not p.  % SAT: -p
a :- b.
b :- a.
a :- not a.