# Work Plan

## Abstract

> In this section, the summary of the proposal should be presented, in Portuguese and English, with an analysis of the state of the art, the main goals to be addressed, the knowledge and skills available in the group, the strategy and methodologies to be used, identifying the novelty and the expected results. 
> 
> The PI must indicate whether the abstract to be used by the FCT for public disseminating will be the same as the abstract previously filled  in. If, for confidentiality reasons, the text of the abstract for publication purposes is different, the PI should click on the button Abstract for publication different. The content of this field will always be the PI's responsibility.

### PT (5000)

### EN (5000)

Analysis of the state of the art

A major limitation of logical representations in real world applications is the implicit assumption that the background knowledge (BK) is perfect. This assumption is problematic if data is noisy, which is often the case. Here we aim to explore how Answer Set Programs (ASP) with probabilistic facts can lead to characterizations of probability functions on the program's domain, which is not straightforward in the context of ASP (see [1, 2, 3, 4]). 

Unlike current systems such as ProbLog [5], P-log [3], LP^MLN [6], or cplint [7], that derive a probability distribution from a program, in our system some choices are represented by a parameter that can be later estimated from further information, eg observations. This approach enables later refinement and scoring of a partial program of a model from additional evidence.

In [8] we address the problem of extending probability from the total choices of an ASP program to the stable models, and from there to general events. Our approach is algebraic in the sense that it relies on an equivalence relation over the set of events and uncertainty is expressed with variables and polynomial expressions. In that work we show how ASP with probability annotated facts, formally Stochastic Answer Set Programs (SASP), can represent arbitrary bayesian networks and therefore express any probability distribution of discrete random variables.

Main goals to be addressed

Applications of this process include assigning a score to a SASP with respect to the empiric distribution of a given dataset. In turn, this score can be used by evolutionary algorithms searching for optimal models of that dataset. 

This makes possible to induce a probabilistic model (a SASP) of observations based and respecting formalized BK. A declarative model of a dataset, expressed in terms of objects and rules of a formal BK, possibly setup from expert knowledge. Such kind of models explain the observations in a (first order) language that, in principle, can be read and interpreted by humans, thus addressing the problem of Explainable Artificial Intelligence (XAI).

Another potential advantage of our approach is that induction of logic programs is usually achieved with small datasets. 

Therefore, the driver of this project that frames the tasks, milestones and main objectives is the use of SASP and the study of induction of SASP from BK and observations.

Task "Structure and Induction of SASP (SI)" main goal is a theoretical study for induction of SAPS. It continues the work of [8] by clarifying the role of SASP structure and composition elements (eg stratified or recursive programs, functional symbols) in the stable models, the equivalence relation of events and, from there, proceed to the study of induction of SASP using program space exploration algorithms based on program transformation rules (eg genetic algorithms).

Task "Integration with existing ASP and ILP software frameworks (INT)" main goal is the implementation of software tools to use and induce SASP. This task is expected to benefit from the theoretical research of the previous task and its results to be used, by non-specialist researchers, in future applications.

Task "High Performance Computing for Induction and Use of SASPs (HPC)" main goal is the speed-up and scale-up of use and induction of SASP using distributed HPC systems. It should benefit from the theoretical work of the first task and from some output of the second task. The expected outcome of this task is set of prototype programs and/or libraries exploring complex knowledge bases or large datasets. 

Task "Applications of SASPs (APP)" main goal is the application of SASP to theoretical and real-world problems. This task is expected to benefit from the software tools from the second and third tasks. In the end, we should get an assessment of the performance of hand-coded and induced SASPs with respect to selected theoretical and real-world problems.

Knowledge and skills available in the group

Francisco Coelho has a PhD in Computer Science and MSc in Mathematics. His main research work deals with the interplay of statistical and logic AI and he has contributed to/with software supporting research work in the areas of machine learning, agent based simulations and combinatorial game theory.

Bruno Dinis has a PhD in Mathematics. He has written over 20 papers on several aspects of logic, for the most part in proof interpretations and its applications (proof mining).

Salvador Abreu [TODO]

Miguel Avillez [TODO]

Strategy and methodologies to be used

The strategic path 

Novelty and the expected results

## State of the art and Objectives (6000)

> In this section, the PI must provide an overview of his/her research field, present the state of the art of the research area in connection with the ground-breaking nature and potential impact of the proposed research project. References to the PI’s previous work should be included. The PI should focus on the following questions:
> - To what extent does the proposed research **address important challenges**?
> - To what extent are the **objectives ambitious and beyond the state of the art** (e.g. novel concepts and approaches or development between or across disciplines)?

Theoretical state of the art and Objectives

A major limitation of logical representations in real world applications is the implicit assumption that the background knowledge (BK) is perfect. This assumption is problematic if data is noisy, which is often the case. Here we aim to explore how Answer Set Programs (ASP) with probabilistic facts can lead to characterizations of probability functions on the program's domain, which is not straightforward in the context of ASP (see [1, 2, 3, 4]).

Unlike current systems such as ProbLog [5], P-log [3], LP^MLN [6], or cplint [7], that derive a probability distribution from a program, in our system some choices are represented by a parameter that can be later estimated from further information, eg observations. This approach enables later refinement and scoring of a partial program of a model from additional evidence.

In [8] we address the problem of extending probability from the total choices of an ASP program to the stable models, and from there to general events. Our approach is algebraic in the sense that it relies on an equivalence relation over the set of events and uncertainty is expressed with variables and polynomial expressions. In that work we show how ASP with probability annotated facts, formally Stochastic Answer Set Programs (SASP), can represent arbitrary bayesian networks and therefore express any probability distribution of discrete random variables.

While the representation of arbitrary bayesian networks conferes to SASP the capability to represent a very large collection of problems, the problem of obtaining such SASP remains open. 

To address it we are intent to utilize the score of an SASP with respect to a dataset (ie evidence), that we introduced and illustrated in [8], to guide evolutionary algorithms exploring a space of programs, thus inducing SASP from evidence and background knowledge.

This is an ambitious objective that we plan to follow with this project by studying (1) the effects of program structure and composition, (2) program transformation rules in task "Structure and Induction of SASP (SI)" and in tasks (3) "Integration with existing ASP and ILP software frameworks (INT)" and (4) "High Performance Computing for Induction and Use of SASP (HPC)". These tasks should provide software tools to use and induce SASP, the former task for general use and the former utilizing distributed HPC to speed-up and scale-up applications of SASP.  

Current systems ([3, 5, 6, 7]) adhere to a semantic of probabilistic logic programs different from ours. Therefore, it is necessary to provide a set of software tools to use and induce SASP.

Application state of the art and Objectives


## Research plan and methods (10000)

> In this section, the PI should describe the proposed research plan and the methodologies to be used, focusing on the following questions:
> - To what extent is the outlined scientific approach feasible bearing in mind the originality and/or ground-breaking potential of the proposed research?
> - To what extent are the proposed research methodology and working arrangements appropriate to achieve the goals of the project?
> - To what extent are the proposed timelines, resources, and PI´s commitment adequate and properly justified?
> 
> Funded projects will now have access to advanced computer resources and research data repositories provided by FCT without the need for further scientific evaluation. This includes computing time in FCT's two new supercomputers, Deucalion and MareNostrum 5. To this end, FCT kindly requests that applicants answer two simple yes/no additional questions:
> - Identify whether the work plan requires advanced computer resources to be provided by FCT.
> - Identify whether the work plan requires space in a research data repository to be provided by the FCT.


## Bibliographic References (1000)

> This section is intended to include the references cited in the state of art and in the research plan and methods, with a cross-referencing methodology chosen by the PI, namely: APA, MLA or Chicago.
> 
> The following elements are considered for each reference: title; authors' names in the order in which they appear in the publication; name of the book or journal; editorial data, where applicable; volume number; page numbers; year of publication. If the publications are available electronically, you can add their URL, although this is not mandatory.
> 
> Bibliographical references are not limited to the PI and team members' publications.

1. Cozman, F. G., & Mauá, D. D. (2020). The joy of probabilistic answer set programming: Semantics, complexity, expressivity, inference. International Journal of Approximate Reasoning, 125, 218-239.
2. Verreet, V., Derkinderen, V., Dos Martires, P. Z., & De Raedt, L. (2022, June). Inference and learning with model uncertainty in probabilistic logic programs. In Proceedings of the AAAI Conference on Artificial Intelligence (Vol. 36, No. 9, pp. 10060-10069).
3. Baral, C., Gelfond, M., & Rushton, N. (2009). Probabilistic reasoning with answer sets. Theory and Practice of Logic Programming, 9(1), 57-144.
4. Pajunen, J., & Janhunen, T. (2021). Solution enumeration by optimality in answer set programming. Theory and Practice of Logic Programming, 21(6), 750-767.
5. De Raedt, L., Kimmig, A., & Toivonen, H. (2007). ProbLog: A probabilistic Prolog and its application in link discovery. In IJCAI 2007, Proceedings of the 20th international joint conference on artificial intelligence (pp. 2462-2467). IJCAI-INT JOINT CONF ARTIF INTELL.
6. Lee, J., & Wang, Y. (2016, March). Weighted rules under the stable model semantics. In Fifteenth international conference on the principles of knowledge representation and reasoning.
7. Alberti, M., Bellodi, E., Cota, G., Riguzzi, F., & Zese, R. (2017). cplint on SWISH: Probabilistic logical inference with a web browser. Intelligenza Artificiale, 11(1), 47-64.
8. Coelho, F., Dinis, B., & Abreu, S. (2024).  An Algebraic Approach to Stochastic ASP. Submitted.
9.  Körner, P., Leuschel, M., Barbosa, J., Costa, V.S., Dahl, V., Hermenegildo, M.V., Morales, J.F., Wielemaker, J., Diaz, D., Abreu, S. and Ciatto, G. (2022). Fifty years of Prolog and beyond. Theory and Practice of Logic Programming, 22(6), 776-858.
10. López, J., Múnera, D., Diaz, D., & Abreu, S. (2018). Weaving of metaheuristics with cooperative parallelism. In Parallel Problem Solving from Nature-PPSN XV: 15th International Conference, Coimbra, Portugal, September 8-12, 2018, Proceedings, Part I 15 (pp. 436-448). Springer International Publishing.

## Past publications (WAITING)

[1] Körner, P., Leuschel, M., Barbosa, J., Costa, V.S., Dahl, V., Hermenegildo, M.V., Morales, J.F., Wielemaker, J., Diaz, D., Abreu, S. and Ciatto, G. (2022). Fifty years of Prolog and beyond. Theory and Practice of Logic Programming, 22(6), 776-858.
[2] Codognet, Philippe, Daniel Diaz, and Salvador Abreu. "Quantum and Digital Annealing for the Quadratic Assignment Problem." 2022 IEEE International Conference on Quantum Software (QSW). IEEE, 2022.
[3] Eloy, Eduardo, Vladimir Bushenkov, and Salvador Abreu. "Constraint Modeling for Forest Management." International Conference on Dynamic Control and Optimization. Cham: Springer International Publishing, 2021.
[4] López, Jheisson, et al. "Weaving of metaheuristics with cooperative parallelism." Parallel Problem Solving from Nature-PPSN XV: 15th International Conference, 2018, Proceedings, Part I 15. Springer International Publishing, 2018.
[5] Codognet, P., Munera, D., Diaz, D. and Abreu, S., 2018. Parallel local search. Handbook of parallel constraint reasoning, pp.381-417

## Tasks (DONE)

## Project timeline and management

### Timeline (DONE)

### Management (3000)

> in this section, the PI should include a description of the project management structure to be adopted, in particular the coordination between participants, the meetings planned and the reporting structure. The proposed structure will depend on the size of the project and, in particular, the existence of participants from different research units.

## Ethical issues (DONE)

## 2030 Agenda (3000)

> The Sustainable Development Goals (SDGs) and the 2030 Agenda, adopted by almost all countries in the world, in the context of the United Nations, define the priorities and aspirations of global sustainable development for 2030 and seek to mobilize global efforts around a set of common goals and objectives.
> 
> There are 17 SDGs, in areas that affect the quality of life of all citizens of the world and those who are yet to come.
> 
> In this section the PI should identify one, or up to a maximum of three, of the 17 Sustainable Development Goals of the United Nations 2030 Agenda and justify how the application fits into the selected SDGs.


## Other projects (DONE)

## Attachments (DONE)

