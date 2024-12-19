# On the Propagation of Weights from Facts to Events

- language for "events"  - _modal_ logic &rarr; assigned to bruno
- axioms for "**stable** models" &rarr; assigned to franc
- axioms for "class" $\{\!\!\{e\}\!\!\}$.
- Relation to a "weight" $\omega(e)$.
- A "distance" $d(a,b)$
- An inner product $a|b$

## More

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
7. What about a "projection" like _e.g._
   $$ <e_1, e_2> = \frac{\left| e_1 \right|}{\left| e_1 \cup e_2\right|}$$ 
   and, instead of using classes, we define
      $$\omega(e) = \sum_{s\in M}<e, s> \omega(s)$$
8. Or inner product.

## Stable models axioms

1. If $a$, $b$ are SM, then neither $a \subset b$ nor $b \subset a$.
2. If $a$ is a SM then $a$ is "consistent".