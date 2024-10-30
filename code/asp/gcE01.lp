col(r ; g ; b).

% var C is local in this rule.
% More specificlly, it is bound to the (lhs) cardinality contraint.
% Also, it varies over all instantiations of col(C).
1 { color(X, C) : col(C) } 1 :- node(X).
:- edge(X, Y), color(X, C), color(Y, C).

#show color/2.