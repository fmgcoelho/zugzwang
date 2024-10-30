a :- b.
a :- \+ a.
b :- a.
% > swipl cyclic.pl
% ERROR: /home/fc/sci/projetos/plp/code/asp/cyclic.pl:2:
% ERROR:    Stack limit (1.0Gb) exceeded
% ERROR:      Stack sizes: local: 1.0Gb, global: 27Kb, trail: 1Kb
% ERROR:      Stack depth: 7,455,777, last-call: 0%, Choice points: 7,455,758
% ERROR:      Probable infinite recursion (cycle):
% ERROR:        [7,455,777] user:p
% ERROR:        [7,455,776] user:p
% Warning: /home/fc/sci/projetos/plp/code/asp/cyclic.pl:2:
% Warning:    Goal (directive) failed: user:p
%