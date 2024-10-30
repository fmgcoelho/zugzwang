r(s1, c1, a).
r(s2, c1, c).
r(s1, c2, b).
r(s2, c3, b).
r(s3, c2, b).
r(s4, c3, b).
1 { r(s3, c4, G) : grade(G) } 1.
1 { r(s4, c4, G) : grade(G) } 1.

student(s1).
student(s2).
student(s3).
student(s4).

course(c1).
course(c2).
course(c3).
course(c4).

grade(a).
grade(b).
grade(c).

better(a, b).
better(b, c).
better(G1, G2) :- better(G1, G3), better(G3, G2).

harder(C1, C2) :- r(S, C1, G1), r(S, C2, G2), better(G2, G1).
harder(C1, C2) :- harder(C1, C3), harder(C3, C2).

smarter(S1, S2) :- r(S1, C, G1), r(S2, C, G2), better(G1, G2).
smarter(S1, S2) :- r(S1, C1, G), r(S2, C2, G), harder(C1, C2).
smarter(S1, S2) :- smarter(S1, S3), smarter(S3, S2).

:- r(S1, C, G1), r(S2, C, G2), smarter(S1, S2), better(G2, G1).
:- r(S, C1, G1), r(S, C2, G2), harder(C1, C2), better(G1, G2).

query(G1, G2) :- r(s3, c4, G1), r(s4, c4, G2).

#show query/2.