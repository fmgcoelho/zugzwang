%not not a.
%% UNSATISFIABLE
%%% ie no models.

% a.
%% Answer: 1
%% a
%% SATISFIABLE
%%% ie there is (only) one (stable) model: {a}

% -a.
%% Answer: 1
%% -a
%% SATISFIABLE

% --a. 
%% *** ERROR: (clingo): parsing failed
%%% WTF?

% not a.
%% Answer: 1
%% 
%% SATISFIABLE
%%% ie there is (only) one (stable) model: {} 
%%%
%%% this program states that there is no information. In particular, there is no information about a.
%%% Therefore there are no provable atoms. Hence the empty set is a stable model.

% not -a.
%% Answer: 1
%% 
%% SATISFIABLE

% b.
% a;c.
% not a :- b.
%% Answer: 1
%% b -a
%% SATISFIABLE

a.
b :- not a.