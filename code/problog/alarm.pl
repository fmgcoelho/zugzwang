0.1::burglary.
0.01::earthquake.

alarm :- burglary.
0.8::alarm :- earthquake.

query(alarm).