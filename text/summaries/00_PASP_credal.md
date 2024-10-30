# Probabilistic Answer Set Programming

## Non-stratified programs

> Minimal example of **non-stratified program**.

The following annotated LP, with clauses $c_1, c_2, c_3$ respectively, is non-stratified (because has a cycle with negated arcs) but no head is disjunctive:
```prolog
0.3::a.                 % c1
s :- not w, not a.      % c2
w :- not s.             % c3
```

This program has three stable models:
$$
\begin{aligned}
m_1 &= \set{ a, w } \cr
m_2 &= \set{ \neg a, s } \cr
m_3 &= \set{ \neg a, w }
\end{aligned}
$$

The probabilistic clause `0.3::a.` defines a **total choice**
$$
\Theta = \set{
    \theta_1 = \set{ a }, 
    \theta_2 = \set{ \neg a }
}
$$
such that
$$
\begin{aligned}
P(\Theta = \set{ a }) &= 0.3\cr
P(\Theta = \set{ \neg a }) &= 0.7 \cr
\end{aligned}
$$

> While it is natural to extend $P( m_1 ) = 0.3$ from $P(\theta_1) = 0.3$ there is no clear way to assign $P(m_2), P(m_3)$ since both models result from the total choice $\theta_2$.



Under the **CWA**, $\sim\!\!q \models \neg q$, so $c_2, c_3$ induce probabilities:

$$
\begin{aligned}
p_a &= P(a | \Theta) \cr
p_s &= P(s | \Theta) &= (1 - p_w)(1 - p_a) \cr
p_w &= P(w | \Theta) &= (1 - p_w)
\end{aligned}
$$
from which results
$$
\begin{equation}
p_s = p_s(1 - p_a).
\end{equation}
$$

So, if $\Theta = \theta_1 = \set{ a }$ (one stable model):

- We have $p_a = P(a | \Theta = \set{ a }) = 1$.
- Equation (1) becomes $p_s = 0$.
- From $p_w = 1 - p_s$ we get $P(w | \Theta) = 1$.

and if $\Theta = \theta_2 = \set{ \neg a }$ (two stable models):

- We have $p_a = P(a | \Theta = \set{ \neg a }) = 0$.
- Equation (1) becomes $p_s = p_s$; Since we know nothing about $p_s$, we let $p_s =  \alpha \in \left[0, 1\right]$.
- We still have the relation $p_w = 1 - p_s$ so $p_w = 1 - \alpha$.

We can now define the **marginals** for $s, w$:
$$
\begin{aligned}
P(s) &=\sum_\theta P(s|\theta)P(\theta)= 0.7\alpha            \cr
P(w) &=\sum_\theta P(s|\theta)P(\theta)= 0.3 + 0.7(1 - \alpha) \cr 
\alpha &\in\left[ 0, 1 \right]
\end{aligned}
$$

> The parameter $\alpha$ not only **expresses insufficient information** to sharply define $p_s$ but also **relates** $p_s$ and $p_w$.

## Disjunctive heads

> Minimal example of **disjunctive heads** program.

Consider this LP

```prolog
0.3::a.
b ; c :- a.
```

with three stable models:
$$
\begin{aligned}
m_1 &= \set{ \neg a } \cr
m_2 &= \set{ a, b } \cr
m_3 &= \set{ a, c }
\end{aligned}
$$

Again, $P(m_1) = 0.3$ is quite natural but there are no clear assignments for $P(m_2), P(m_3)$.

The total choices here are
$$
\Theta = \set{
    \theta_1 = \set{ a }
    \theta_2 = \set{ \neg a }
}
$$
such that
$$
\begin{aligned}
P(\Theta = \set{ a }) &= 0.3\cr
P(\Theta = \set{ \neg a }) &= 0.7 \cr
\end{aligned}
$$
and the LP induces
$$
P(b \vee c | \Theta) = P(a | \Theta).
$$

Since the disjunctive expands as
$$
\begin{equation}
P(b \vee c | \Theta) = P(b | \Theta) + P( c | \Theta)  - P(b \wedge c | \Theta)
\end{equation}
$$
and we know that $P(b \vee c | \Theta) = P(a | \Theta)$ we need two independent parameters, for example
$$
\begin{aligned}
P(b | \Theta) &= \beta \cr
P(c | \Theta) &= \gamma \cr
\end{aligned}
$$
where
$$
\begin{aligned}
    \alpha & \in \left[0, 0.3\right] \cr
    \beta & \in \left[0, \alpha\right]
\end{aligned}
$$

This example also calls for reconsidering the CWA since it entails that **we should assume that $b$ and $c$ are conditionally independent given $a$.**