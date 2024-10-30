# PASP Drafts

Consider the logic program

$$
\begin{aligned}
c_1 &= a \vee \neg a, \cr
c_2 &= b \larr \sim a \land \sim c, \cr
c_3 &= c \larr \sim b 
\end{aligned}
$$

This program has three stable models:

$$
\begin{aligned}
m_1 &= \set{a, c} \cr
m_2 &= \set{b, \neg a} \cr
m_3 &= \set{c, \neg a}  
\end{aligned}
$$