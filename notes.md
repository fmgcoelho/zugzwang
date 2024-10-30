# Zugzwang Meetings

## 2024-04-17 - Online meeting

- Anchor in the "0000" refs:
  - Annotated Logic Programming
    - Need to investigate how/if our semantic for annotations is compatible.
    - What about update from "observations" and the "score" of a program?
  - Probabilistic Database
    - Need to investigate how to incorporate the combination strategies for interdependence.
- Example suggestion?
  
## 2024-04-16 - Presencial meeting

- Abandon KR, consider EPIA.
- Keep the ICLP chance.
- Anchor in refs "0000".
- Give more examples.
- Explain better what we've done and what we've used.. 

## 2024-03-25 - Meeting

- Próxima reunião: terça, 11:00 + \epsilon
- Reestruturação.
- Todos vêm "Thorough comparison with related work"
- Tratar "Give a general argument [about Bayesian networks]"
- Secção 4 para apêndice?
- ICLP -> foco na linguagem

## 2024-03-25 - Work on KR24

### From "Twelve Definitions..."

- ... programs in which recursion and negation "don't mix." Such programs are called **stratified**. 
- stable model semantics, as well as the well-founded semantics can be seen as an attempt to generalize and simplify the iterated fixpoint semantics of stratified semantics.
- three theories of **nonmonotonic reasoning**
  - circunspection: syntactic transformation that turns a first-order sentence F into the conjunction of F with another formula, which expresses a minimality condition.
  - default logic: _I didn't got it_
  - autoepistemic logic: modal operator Lp: "p is believed".

## 2024-03-20 - Work on KR24 and ICLP24

- s(cASP): installed, tested, performance dismaying (can't solve 8-queens) vs. clingo that solves 8-queens in 0.004s and 100-queens in 
- Detail syntax and semantics

## 2024-03-15 - IJCAR24 Reviews

### Summary

- State-of-the-art:
  - Thorough comparison with related work 
- Motivation:
  - Clarify the application of the approach
  - Explore the advantages and limitations of the formalism
- Technical details:
  - Self-containment
  - Detail syntax and semantics of the considered class of programs.
  - Clarify the relation of stable models and events
  - Recall the stable model semantics and its properties
  - Argument for Proposition 1 [is not] convincing
- Fixes:
  - Provide the probabilities of the classes and of the events
  - Clarify the role of "testing of the prior distributions"
  - Give a general argument [about Bayesian networks] instead of an illustration on a simple example.

See [Reviews file](text/paper_01/LLNCS/reviews_IJCAR24.md).

- Para ICLP24 (2024-04-29)
  - Mais técnico.
  - Considerar scasp.
- Para KR24 (2024-04-24)
  - Mais formal.
- Overleaf
  - authentication key: olp_1oPNhAUwN9ihvWzd4n92hEd9UQUbK44ul5Gg
  - zw-kr: git clone https://git@git.overleaf.com/65f422781f1d04e2c0aefd56
  - zw-iclp: git clone https://git@git.overleaf.com/65f422dc70a60d8ab7fde402

## 2024-01-30 - Exploratory Research Project

> Apply for FCT funding.


## 2024-01-05 - Next Research Lines

> After the base-setting work of "_An Algebraic Approach to Stochastic ASP_" these are the next tasks to consider. Is summary:
> 1. **Logic Programming** - Stratified & Non-stratified programs
> 2. **Computer Science** - Inductive Logic Programming
> 3. **Software** - Integration with Potassco and other frameworks
> 4. **Applications**

#### Line 1: Logic Programming - Stratified & Non-stratified programs

##### Line 1a

> _Stratified_ & _non-stratified_ programs are quoted in the "CREDAL" papers as important classes of logic programs.

Minimal example of a **non-stratified program**.

The following annotated LP, with clauses $c_1, c_2, c_3$ respectively, is non-stratified (because has a cycle with negated arcs) but no head is disjunctive:
```prolog
0.3::a.                 % c1
b :- not c, not a.      % c2
c :- not b.             % c3
```

This program has three stable models:
$$
\begin{aligned}
m_1 &= \set{ a, c } \cr
m_2 &= \set{ \neg a, b } \cr
m_3 &= \set{ \neg a, c }
\end{aligned}
$$

> We should **investigate** _What are stratified programs and why are they important?_ and how does our approach deals with such programs?

##### Line 1b - Investigate the expressiveness of PASP

Consider:

- Recursion
- Variables,
- functional symbols,

##### Line 1c - The equivalence relation

Consider the cases where only $s \subseteq e$ and $e \subseteq s$. Or other refinements. Also consider the inconsistent and independent events.

##### Line 1d - Stability of the error function

Consider alternative error functions. See statistics, Kullback-Leibler divergence

#### Line 2: Computer Science - Inductive Logic Programming

> Proceed from scoring programs to support genetic algorithms or other program space exploration methods.

Scoring programs, as described in our paper, is just a step into **Inductive Logic Programming**. To go further, we need to explore algorithms that:

1. Use **background knowledge**, expressed as a PLP.
2. Consult **positive examples** that should be _soft_ induced.
3. Consult **negative examples** that should be _soft_ excluded.
4. Generate **PLPs** that are scored.
5. Recombine the **best scored** into a new _population_, using recombination rules.

> In order to do that, **PLPs must be expressed as data structures** to be manipulated. Also **recombination rules** must investigated before become formally expressed and supported with adequate methods.

#### Line 3: Software - Integration with Potassco and other frameworks

> Support annotated programs with zugzwang semantics.

- Bayesian Networks (BII Alice)
  - Generate an annotated asp program from a bayesian network and run it trough `clingo`.
  - Recover the stable models from the previous ste and compute the respective probabilities.
- Program Manipulation
  - Annotated ASP program _representation_ and a _parser_.

#### Line 4: Applications

> Apply zugzwang to a few showcases, besides the theoretic corner stones (non-stratified, disjunctive, bayes networks), preferably based in real world scenarios, with complex structure and large datasets.

- (Stochastic) Plan Generation
- Yale-Shooting Problem
- (Stochastic) Situation Calculus
- Frame Problem
- Latent Facts - and core assumptions.
- Given a **Bayesian Network** (or a **Markov Networks**):
  - Represent it. (**done** for BNs; MNs?)
  - Solve the common probability tasks: join (**done**), marginals, conditionals, parameter learning, inferring unobserved variables, sample generation, _etc._
- Given a _solved_ ASP specification:
  - What is the marginal probability of the atom `a`? (**done**)
  - What other probability queries are important to consider?
- Given an _unsolved_ ASP specification:
  - What is the probability (distribution?) of the probabilistic fact `a`?
  - What other questions are relevant? _E.g._ the distribution family of a fact?
- Given a _solved_ ASP specification and a set of _samples_:
  - How do the probabilities inferred from the specification match the ones from the empiric distribution? (**done** might see alternative approaches)
- Given two _solved_ ASP specification and a set of _samples_:
  - Which specification best describes the empiric distribution? (**done**)

## 2024-01-05 - Publish Paper "AASASP"

> Target conferences to publish paper "AASASP"
> Shared spreadsheet: <https://docs.google.com/spreadsheets/d/1KJdA-zj3Xly-_tSE6tjbd7M9SttC9xBixXoqWZJFVfg>

| Conference | Abstract Deadline | Conference Date |                      Location | OBS               |
|-----------:|:------------------|:----------------|------------------------------:|-------------------|
| IJCAR 2024 | 2024-01-29        | 2024-07-3:6     |                 Nancy, France | ~Picked~ Rejected |
|    ECAI'24 | 2024-04-19        | 2024-10-19:24   | Santiago de Compostela, Spain |                   |
|    KR 2024 | 2024-04-24        | 2024-11-2:8     |                Hanoi, Vietnam |                   |
|   GECCO 24 | 2024-02-05        | 2024-07-14:18   |           Melboune, Australia | Overdue           |
|    ICLP 24 | 2024-04-15        |                 |                               | preferred         |
|   JELIA 25 |                   |                 |                               |                   |
|    ICFP 24 | 2024-03-01        | 2024-09-2:7     |                  Milan, Italy |                   |

## 2023-02-28 - Looking for Application Examples

What **applications** are we looking for?

- (Stochastic) Plan Generation
- Yale-Shooting Problem
- (Stochastic) Situation Calculus
- Frame Problem
- Given a **Bayesian Network** (or a **Markov Networks**):
  - Represent it.
  - Solve the common probability tasks: marginals, conditionals, parameter learning, inferring unobserved variables, sample generation, _etc._
- Given a _solved_ ASP specification:
  - What is the marginal probability of the atom `a`?
  - What other probability queries are important to consider?
- Given an _unsolved_ ASP specification:
  - What is the probability (distribution?) of the probabilistic fact `a`?
  - What other questions are relevant? E.g. the distribution family of a fact?
- Given a _solved_ ASP specification and a set of _samples_:
  - How do the probabilities inferred from the specification match the ones from the empiric distribution?
- Given two _solved_ ASP specification and a set of _samples_:
  - Which specification best describes the empiric distribution?

What should be the **task for the scholarship student**? _Use the `Python` API of `clingo`._

1. Read a string and extract probability annotations; Associate those annotations with the respective atoms.
2. Call `clingo` to get stable models.
3. Support **computation of the equivalence classes**: _Which functions and relations?_
4. Compute event probability using _weighted model counting_ on the equivalence classes. 
5. Read a Bayesian Network from a file (`BIF`, `DSC`, `NET`, `RDA`, `RDS`, ...) and generate an annotated "ASP" specification.

2022 - AAAI - Inference and Learning with Model Uncertainty in Probabilistic Logic Programs
- Is **"Epistemic Uncertainty (EU)"** the right framework for Zugzwang? How relevant are the epistemic  questions in this paper to our work?
- EU can be represented by _Credal Sets, Subjective Logic_ and _Beta Distributions_?
- **Experiments** made with BNs from [(Kaplan and Ivanovska 2018)](https://www.sciencedirect.com/science/article/pii/S0888613X17302384) and larger networks from the [BNLearn repository](https://www.bnlearn.com/bnrepository).
- **Are networks, Bayesian Networks in particular, a "good enough" pool of "example applications" to us, for now?**

## 2023-01-10 - 15:00

- Paper
- Project
- Latent Facts

## 2022-12-12

- Is the project proposal ok? How long/detailed should it be?
- Initial exploratory code `event_lattice.py` and `EventLattice.ipynb` done.
- Start writing paper: Introduction, state of the art, motivation
  - Identify key problems
  - Target Conferences
    - KR;
    - [ICLP](https://waset.org/language-planning-conference-in-april-2023-in-lisbon); 
    - [ECAI](https://ecai2023.eu/)
- Next task for prototype: 
  - Get stable models from potassco/s(casp)
  - other?

## 2022-12-05

- Created shared folder (gdrive:zugzwang) <https://drive.google.com/drive/folders/1xs-cjxWJzn2JxqeNgh9LX5xWN50BW-Be?usp=share_link>
- Refine project tasks, for Bachelor, M.Sc., Ph.D. students and for researchers. 

## Resources

### Conferences 

- [Conferences Sheet](https://docs.google.com/spreadsheets/d/1KJdA-zj3Xly-_tSE6tjbd7M9SttC9xBixXoqWZJFVfg/edit#gid=0)