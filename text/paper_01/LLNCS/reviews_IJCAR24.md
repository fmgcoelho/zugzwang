# Reviews of IJCAR24

## Summary

- the paper lacks clarity and maturity for a formal publication.
  - syntax and semantics of the considered class of programs is not defined;
  - the relation of stable models and events as well as the application of the approach is insufficiently motivated;
  - a more thorough comparison between the proposed method and related work is missing.
- the work is still in a very preliminary state.
  - half of the paper is focused on developing a toy example in all its details. The space would have been better used developing deeper technical details, and exploring the advantages and limitations of the formalism.
- the paper feels somewhat incomplete and incoherent
  - initial issues in the presentation that could be improved (for instance, for self-containment, recall the stable model semantics and its properties, as this is central for the presented method)
  - argument for Proposition 1 [is not] convincing [...] it should not be
  the case that all events are disjoint.
  - it would be insightful to not only provide the probabilities of the classes, but also of the events
  - "testing of the prior distributions" comes a bit unexpected, and it is not fully clear what is the role.
  - I don't see why someone would use a stochastic program to model a Bayesian network. If there is a relation, I would rather want to see a general argument, then an illustration on a simple example.


## REVIEW 1

SUBMISSION: 23
TITLE: An Algebraic Approach to Stochastic ASP
AUTHORS: Francisco Coelho, Bruno Dinis and Salvador Abreu

----------- Overall evaluation -----------
SCORE: -1 (weak reject)
----- TEXT:
The authors present an approach to define a probability distribution on events based on logic programs with probabilistic facts. As different choices for the probabilistic facts can give rise to different answer sets, parameters are introduced to capture this relation in a probabilistic sense. These parameters can later be estimated using data.    

Unfortunately, the paper lacks clarity and maturity for a formal publication.
The main issues here are that 
1) syntax and semantics of the considered class of programs is not defined;
2) the relation of stable models and events as well as the application of the approach is insufficiently motivated; and
3) a more thorough comparison between the proposed method and related work is missing.


Section 1:
What is the precise syntactic class of programs that is considered here and how is its semantic formally defined? The introduction mentions normal programs and stable models, later disjunctions, choice rules, and weak constraints, as well as the distribution semantics are mentioned. It is stated however in Section 5 that recursion has not been considered in this work. So the scope of the contribution is unclear.

What does extending a probability from total choices to cover the program domain mean? What is the program domain? 

The motivation for this work is a little vague. If they goal is to find models for a dataset, what is the role of the program and what is the role of events that do not correspond to answer sets of the program? An example would be helpful. I'm in particular confused that observations can be supersets of states. 

Section 2:
There are of course proposals how to define a probability distributions on answer sets based on probabilistic facts. The relation of this proposal to such approaches and their limitations should be discussed more thoroughly.

The significance of Item 2 is not clear. Also, when are observations not consistent with a program?

What is described as "total choice" in the remainder of the paper has been defined as pre-total choice in the introduction.

Section 3:
The purpose of Fig. 1 is unclear without more explanation of the process that is illustrated.

The abstract is not very informative without further context. Consider expanding it.


## REVIEW 2

SUBMISSION: 23
TITLE: An Algebraic Approach to Stochastic ASP
AUTHORS: Francisco Coelho, Bruno Dinis and Salvador Abreu

----------- Overall evaluation -----------
SCORE: -1 (weak reject)
----- TEXT:
This submission proposes a new probabilistic semantics for ASP programs, where the overall distribution is not pre-specified, but can be algebraically annotated and updated in presence of evidence. The semantics introduces an interplay between events and stable models.

One of the main drawbacks of most probabilistic extensions of logical languages is that they tend to introduce many strong assumptions just for the sake of obtaining one, effectively computable, probability distribution. This work tries to reverse that tendency by considering just the explicit information from the program (and perhaps external observations). I found it refreshing. The way the authors deal with the lack of information (and the relation to stable models) is also, to my knowledge, novel. I have not seen similar approaches even in other probabilistic settings.

Unfortunately, the work is still in a very preliminary state. The authors acknowledge that there is much to do still. In this case, half of the paper is focused on developing a toy example in all its details. The space would have been better used developing deeper technical details, and exploring the advantages and limitations of the formalism.

While I believe that the work is not yet mature enough for IJCAR, I do encourage the authors to continue in this track.

Some minor details:
- in English, "Bayesian" is written with a capital letter. Change all "bayesian" to "Bayesian"
- try to avoid contractions. "don't" - "do not", "we've" - "we have", etc.
- in page 8, "it's" - "its"
- In Definition 2, to say that both events are inconsistent, it is better to write {u,v}\cap W = \emptyset


## REVIEW 3

SUBMISSION: 23
TITLE: An Algebraic Approach to Stochastic ASP
AUTHORS: Francisco Coelho, Bruno Dinis and Salvador Abreu

----------- Overall evaluation -----------
SCORE: -2 (reject)
----- TEXT:
The paper presents an approach to add probabilities to answer set programs. In the resulting stochastic answer set programs, rules are combined with stochastic facts, which assign probabilities to program variables. With no rules present, those variables are then treated as independent variables for determining the joint probabilities of different variable assignments. The main question that the paper is concerned with is what to do if also rules are involved, interpreted under the stable model semantics. How to obtain the probability of derived variables, and how are the probabilities of facts affected by the constraints given by the program? Due to the non-monotonic nature of this semantics, this is not straight-forward, and requires a different treatment in monotonic rule languages such as datalog. 

The aim is thus to define a probability measure that assigns probabilities to partial truth assignments (probabilistic events) of variables occurring in the program. As common with probability theories, these partial truth assignments are then called events. Every stable model corresponds to an event, but also subsets and supersets of stable models are events that need a probability assigned. The authors make the reasonable assumption that stable models correspond to disjoint events, and that events that are not compatible to any stable model should have a probability of 0. Based on these assumptions, they then develop a probability measure that takes into account the relation of events to the stable models, as well as the probabilties provided by the stochastic facts. 

After this semantics is introduced, the authors illustrate it on a simple example and a slightly more involved one that is commonly used to illustrate Bayesian networks. The probabilities obtained for the simple example are compared with probabilities that are obtained by a statistical simulation, essentially drawing samples on the probabilistic distribution. The second example showcases how probabilities represented in a Bayesian network could be modelled using their stochatic programs. 

The paper is mostly well-written, and the ideas initially sound convincing. There are some initial issues in the presentation that could be improved (for instance, for self-containment, I think one should at least recall the stable model semantics and its properties, as this is central for the presented method). From page 9 on, I observe some more major issues:

1. I didn't find the argument for Proposition 1 convincing, unless there is something strange in the semantics. Namely, while stable models correspond to pair-wise disjoint events, it should not be the case that all events are disjoint. In particular, if one event
E1 is a subset of another event E2 (i.e., E1 assigns less values than E2), I would assume that the probability of E2 is contained in that of E1. This is at least how it behaves classically (e.g., without rules). Therefore, the assumption that the total choices cover the entire probability space does not  imply that the probability of all other events, including the stable models, becomes zero. While I would expect that something like Proposition 1 should hold, the present argument needs more work.
2. For the developed examples, I think it would be insightful to not only provide the probabilities of the classes, but also of the events (e.g.: what is the probability of a? What is the probability of ac?) If this information is supposed to be present in (18), then something is clearly going wrong - how do I interpret the 0 in column "¬a,ac"? What is the event e here?
3. The "testing of the prior distributions" comes a bit unexpected, and it is not fully clear what is the role. Are you trying to empirically justify your sematics? What is the purpose of doing that in a single example? In any case, the role of this in the greater story of the paper is not clear to me 
4. Similarly, I don't see why someone would use a stochastic program to model a Bayesian network. If there is a relation, I would rather want to see a general argument, then an illustration on a simple example. In any case, I don't think stochastic answer set programs should be used as replacements of Bayesian networks.

In total, the paper feels somewhat incomplete and incoherent, which is why I do not recommend acceptance.


