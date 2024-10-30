# Features of SASP, P-Log and LPMLN



- LPMLP: weighted rule from Markov Logic
- Plog: probabilistic nonmonoticity (change the probabilistic model as result of new information)
- LPMLP: W(I), I **interpretation**; If I not stable model then W(I) = 0 [^1].
- Plog: mu(W); W **possible world** _ie_ stable model [^1].
- Plog: Uses _default probability_ (based on the _indifference principle_ - two possible values are equally likely if we have no reason to prefer one over the other) when the conditional part of "pr-atoms" in not satisfied by a stable model [^2]. 
- SASP: p(e), e "event"


Sources:

[^1]: [LEE, Joohyung; YANG, Zhun. LPMLN, weak constraints, and P-log. In: Proceedings of the AAAI Conference on Artificial Intelligence. 2017.](https://ojs.aaai.org/index.php/AAAI/article/view/10686)

[^2]: [GELFOND, Michael; RUSHTON, Nelson. Causal and probabilistic reasoning in P-log. Heuristics, probabilities and causality. A tribute to Judea Pearl, 2010, 337-359.](https://www.depts.ttu.edu/cs/research/documents/35.pdf)