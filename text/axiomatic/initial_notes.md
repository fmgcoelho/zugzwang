For each $e\in E$, define $\{\{e\}\} \subseteq M$ such that:

1. $\forall s \in M, s \in \{\{s\}\}$.
2. $\forall s, s' \in M$ if $s'\in \{\{s\}\}$ then $s' = s$.
3. If $e \not\in W$ then $\{\{e\}\} = \emptyset$.
4. Special case 1, the Zugzwang paper stream:
   1. $e \supseteq s \Rightarrow s \in \{\{e\}\}$.
   2. $e \subseteq s \Rightarrow s \in \{\{e\}\}$.
5. Special case 2, Levenshtein distance:
   1. We know that $x_0 = \min\{d_L(s,s'): s, s' \in M, s' \not= s\} > 1$. But need to prove.
   2. $\{\{e\}\}_x = \{ s \in M : d_L(e,s) \leq x\}$.
   3. For $x = 0$ we get a distribution with all mass in $M$; what "others" are doing when define a probability on $M$.
   4. We can set
    $$\{\{e\}\}' = \{s \in M : d_L(e, s) = \min d_L(e,M)\}$$
    and then consider two cases:
    - If $\{\{e\}\}'$ has more than one element, $\{\{e\}\} = \emptyset$, or not.
6. Is there any relation with the Hamming distance and code correction?