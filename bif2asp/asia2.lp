% prob(asia, "0.01").
asia ; -asia.
% prob(tub, [asia], "0.05").
tub ; -tub :- asia.
% prob(tub, [-asia], "0.01").
tub ; -tub :- -asia.
% prob(smoke, "0.5").
smoke ; -smoke.
% prob(lung, [smoke], "0.1").
lung ; -lung :- smoke.
% prob(lung, [-smoke], "0.01").
lung ; -lung :- -smoke.
% prob(bronc, [smoke], "0.6").
bronc ; -bronc :- smoke.
% prob(bronc, [-smoke], "0.3").
bronc ; -bronc :- -smoke.
% prob(either, [lung, -tub], "1.0").
either ; -either :- lung, -tub.
% prob(either, [-lung, tub], "1.0").
either ; -either :- -lung, tub.
% prob(either, [lung, tub], "1.0").
either ; -either :- lung, tub.
% prob(either, [-lung, -tub], "0.0").
either ; -either :- -lung, -tub.
% prob(xray, [either], "0.98").
xray ; -xray :- either.
% prob(xray, [-either], "0.05").
xray ; -xray :- -either.
% prob(dysp, [bronc, -either], "0.8").
dysp ; -dysp :- bronc, -either.
% prob(dysp, [-bronc, either], "0.7").
dysp ; -dysp :- -bronc, either.
% prob(dysp, [bronc, either], "0.9").
dysp ; -dysp :- bronc, either.
% prob(dysp, [-bronc, -either], "0.1").
dysp ; -dysp :- -bronc, -either.