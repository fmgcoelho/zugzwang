# Probabilistic ASP

## Weighted Approach

1. **Total Choices.** $N(C = x) = \prod_{a \in x} w_a \prod_{\neg a \in x} (1 - w_a)$.
2. **Stable Models.** $N(S = x | C = c) = \alpha_{x,c}$,
    where the set of parameters $\alpha_{x,c}$ is such that:
    $$
    \begin{cases}
        \alpha_{x,c} \geq 0, & \forall c, x\cr
        \alpha_{x,c} = 0, & \forall x \not\supseteq c \cr
        \sum_{x} \alpha_{x,c} = 1, & \forall c.
    \end{cases}
    $$
3. **Worlds.** $N(W = x)$
   1. If $x$ is a _total choice_: $
    N(W = x) = \prod_{a \in x} w_a \prod_{\neg a \in x} (1 - w_a).
    $$