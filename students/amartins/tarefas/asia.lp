%* 0.01 :: asia. *% 
asia ; -asia. 

%* 0.05 :: tub :- asia. *% 
tub ; -tub :- asia. 
%* 0.01 :: tub :- -asia. *% 
tub ; -tub :- -asia. 

%* 0.5 :: smoke. *% 
smoke ; -smoke. 

%* 0.1 :: lung :- smoke. *% 
lung ; -lung :- smoke. 
%* 0.01 :: lung :- -smoke. *% 
lung ; -lung :- -smoke. 

%* 0.6 :: bronc :- smoke. *% 
bronc ; -bronc :- smoke. 
%* 0.3 :: bronc :- -smoke. *% 
bronc ; -bronc :- -smoke. 

%* 1.0 :: either :- lung, tub. *% 
either ; -either :- lung, tub. 
%* 1.0 :: either :- -lung, tub. *% 
either ; -either :- -lung, tub. 
%* 1.0 :: either :- lung, -tub. *% 
either ; -either :- lung, -tub. 
%* 0.0 :: either :- -lung, -tub. *% 
either ; -either :- -lung, -tub. 
%* 0.98 :: xray :- either. *% 
xray ; -xray :- either. 
%* 0.05 :: xray :- -either. *% 
xray ; -xray :- -either. 

%* 0.9 :: dysp :- bronc, either. *% 
dysp ; -dysp :- bronc, either. 
%* 0.7 :: dysp :- -bronc, either. *% 
dysp ; -dysp :- -bronc, either. 
%* 0.8 :: dysp :- bronc, -either. *% 
dysp ; -dysp :- bronc, -either. 
%* 0.1 :: dysp :- -bronc, -either. *% 
dysp ; -dysp :- -bronc, -either. 

