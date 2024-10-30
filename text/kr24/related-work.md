# Related Work

## Theoretical

- Cozman: Credal sets
- Gopal Gupta: Stable models without grounding
- Others? 

### Cozman and Credal sets

[Cozman, F. G., and Mauá, D. D. 2020. The joy of probabilistic answer set programming: semantics, complexity, expressivity, inference. International Journal of Approximate Reasoning 125:218-239](https://doi.org/10.1016/j.ijar.2020.07.004) and [local file](<../../biblio/2020 - The joy of Probabilistic Answer Set Programming: Semantics - complexity, expressivity, inference - Fabio Gagliardi Cozman, Denis Deratani Mauá.pdf>).

- The semantics for logic programs (with disjunctive heads, negation, cycles)
- if a probabilistic logic program is such that it has more than a minimal model for some realization of the random facts, we simply build the credal set consisting of all possible distributions induced by the product measure over random facts.
- Assigns probability P(t) to total choices and P(m|t) to stable models.
- Uncertainty about the P(a) is bounded by a lower and upper probabilities.


### Gopal Gupta and stable models without grounding

Another promising approach to handle the generation of stable mo\-dels is the one supported by \texttt{s(CASP)}, a system that can evaluate ASP programs with function symbols (functors) and constraints without grounding them either before or during execution, using a method similar to SLD resolution \cite{marple2017computing,arias2020justifications}. This enables the generation human readable of explanations of the results of programs and addresses two major issues of grounding-based solvers, that 1) either do not support function symbols or, using finite domains, lead to exponential groundings of a program and 2) compute the complete model of the grounded program when, in some scenarios, it is desirable to compute only a partial stable model containing a query.

### Fierens, van den Broeck, de Raedt and Problog2

- A ProbLog program specifies a probability distribution over possible worlds.
- world  is a model of C \cup R where C is a total choice and R the set of rules of a program. 
- Semantics only defined for **sound** programas (Riguzzi and Swift 2013) i.e., programs for which each possible total choice C leads to a well-founded model that is two-valued or 'total' (Riguzzi and Swift 2013; Van Gelder et al. 1991). A sufficient condition for this is that the rules in the ProbLog program are locally stratified (Van Gelder et al. 1991). In particular, this trivially holds for all negation-free programs.
- Probability of a possible world that is a model of the program is the probability of the total choice. Otherwise probability is 0.

### Lee and Wang LP^MLN 

- lee2016weighted,lee2017lpmln
- Extends Problog
- based on Markov Logic (Richardson and Domingos 2006)
- weighted rules $a \leftarrow b, n$ where $a$ is disjunction of atoms, $b$ is conjunction of atoms,  $n$ is constructed from atoms using conjunction, disjunction and negation.
- For each model there is a unique maximal set of rules that are satisfied by it. The respective weights determine the probability of the model.
- 

## Tools

- Problog (fierens2015inference, verreet2022inference)
- PRISM (Sato 2008); ICL (Poole 2008); LPAD (Vennekens 2009)
- P-log 
- LPMLN
- plingo
- scasp
- Markov Logic
- Others? Who's in KR and ICLP?