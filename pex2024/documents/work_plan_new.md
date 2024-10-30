# Work Plan [DRAFT]

## Abstract [DRAFT]

> In this section, the summary of the proposal should be presented, in Portuguese and English, with an analysis of the state of the art, the main goals to be addressed, the knowledge and skills available in the group, the strategy and methodologies to be used, identifying the novelty and the expected results. 
> 
> The PI must indicate whether the abstract to be used by the FCT for public disseminating will be the same as the abstract previously filled  in. If, for confidentiality reasons, the text of the abstract for publication purposes is different, the PI should click on the button Abstract for publication different. The content of this field will always be the PI's responsibility.

### PT (5000)  [DRAFT]

[DRAFT]

Esta pesquisa visa superar as restrições das representações lógicas em cenários do mundo real com elementos probabilísticos, expandindo a Programação Lógica Probabilística (PLP) com Programas Estocásticos de Conjunto de Respostas (SASP). Embora os sistemas PLP atuais, como o ProbLog, forneçam algumas soluções, persistem desafios na caracterização de distribuições de probabilidade para Programas de Conjunto de Respostas (ASP) com fatos probabilísticos. A abordagem SASP proposta introduz um método algébrico para representar a incerteza e integra algoritmos evolutivos para induzir modelos SASP. O plano de pesquisa envolve análise teórica, desenvolvimento de algoritmos, avaliação empírica e colaboração interdisciplinar. Os principais objetivos incluem investigar a estrutura e composição do programa na modelação SASP, desenvolver regras e algoritmos de transformação e avaliar modelos SASP codificados manualmente e induzidos em casos teóricos e do mundo real.

Estado da arte
    Sistemas PLP como o ProbLog abordam limitações de representações lógicas com distribuições de probabilidade.
    No entanto, caracterizar distribuições de probabilidade para ASP estendidos com fatos probabilísticos permanece um desafio.
    A abordagem SASP proposta estende ASP, representa a incerteza algebricamente e incorpora algoritmos evolutivos para indução de modelos.

Objetivos principais
    Investigar o papel da estrutura dos programa na utilização de SASP na modelação de fenómenos probabilísticos.
    Investigar a aplicação de algoritmos evolutivos para indução de modelos SASP com base em conhecimento e evidências adicionais.
    Avaliar modelos SASP codificados manualmente ou induzidos, em casos teóricos e do mundo real.

Conhecimento e competências
    O grupo tem experiência em lógica, programação lógica e sistemas distribuídos.
    Trabalhos anteriores demonstram a viabilidade e a capacidade representativa dos SASP.
    A colaboração numa equipa interdisciplinar garante diversas perspetivas.

Estratégia e Metodologias
    A análise teórica explorará os efeitos da estrutura dos programas SASP na modelação de fenómenos probabilísticos.
    O desenvolvimento de algoritmos será focado on uso de SASP para a modelação de fenómenos probabilísticos e indução indução de modelos SASP.
    A avaliação empírica irá apurar o desempenho dos modelos em vários casos.
    A colaboração interdisciplinar promove a inovação e garante pesquisas abrangentes.

Novidade e resultados esperados
    A novidade está na semântica probabilística do SASP, na pontuação resultante baseada em evidências e na utilização dessa pontuação para induzir SASP a partir de conhecimento anterior e evidência.
    Os resultados esperados incluem melhor compreensão da modelação SASP, algoritmos eficientes e modelos SASP validados.

No geral, a pesquisa proposta aborda limitações críticas na programação lógica probabilística com ASP e visa avançar através de metodologias inovadoras e colaboração interdisciplinar. O plano de investigação abrangente, apoiado pelos conhecimentos e recursos existentes, demonstra um forte potencial para contribuições significativas para esse problema.

### EN (5000) [DRAFT]

[DRAFT]

This research aims to overcome the constraints of logical representations in real-world scenarios with probabilistic elements by expanding Probabilistic Logic Programming (PLP) with Stochastic Answer Set Programs (SASP). While current PLP systems like ProbLog provide some solutions, challenges persist in characterizing probability distributions for Answer Set Programs (ASP) with probabilistic facts. The proposed SASP approach introduces an algebraic method to represent uncertainty and integrates evolutionary algorithms for inducing SASP models. The research plan involves theoretical analysis, algorithm development, empirical evaluation, and interdisciplinary collaboration. Key objectives include investigating program structure and composition in SASP modeling, developing transformation rules and algorithms, and evaluating hand-coded and induced SASP models on theoretical and real-world cases.

State of the Art:
    PLP systems like ProbLog address limitations of logical representations with probability distributions.
    However, characterizing probability distributions for Answer Set Programs extended with probabilistic facts remains challenging.
    The proposed SASP approach extends ASP, represents uncertainty algebraically, and incorporates evolutionary algorithms for model induction.

Main Goals:
    Investigate the role of program structure in the utilization of PASP for modeling probabilistic phenomena.
    Investigate the application of evolutionary algorithms for induction of SASP models based on additional background knowledge and evidence.
    Evaluate hand-coded or induced SASP models, on theoretical and real-world cases.

Knowledge and Skills:
    The group possesses expertise in logic, logic programming, and distributed systems.
    Previous work demonstrates the feasibility and representational power of SASP.
    Collaboration with an interdisciplinary team ensures diverse perspectives.

Strategy and Methodologies:
    Theoretical analysis will explore SASP program structure effects on modeling probabilistic phenomena.
    Algorithm development will focus on transformation rules and efficient exploration of SASP space.
    Empirical evaluation will assess model performance on various cases.
    Interdisciplinary collaboration fosters innovation and ensures comprehensive research.

Novelty and Expected Results:
    The novelty lies in the probabilist semantics of SASP, the resulting score based in evidence and the utilization of that score to induce SASP from background knowledge and evidence.
    Expected results include improved understanding of SASP modeling, efficient algorithms, and validated SASP models.

Overall, the proposed research addresses critical limitations in probabilistic logic programming with ASP and aims to advance the field through innovative methodologies and interdisciplinary collaboration. The comprehensive research plan, supported by existing expertise and resources, demonstrates a strong potential for significant contributions to the field.

## State of the art and Objectives (6000)  [DRAFT]

> In this section, the PI must provide an overview of his/her research field, present the state of the art of the research area in connection with the ground-breaking nature and potential impact of the proposed research project. References to the PI's previous work should be included. The PI should focus on the following questions:
> - To what extent does the proposed research **address important challenges**?
> - To what extent are the **objectives ambitious and beyond the state of the art** (e.g. novel concepts and approaches or development between or across disciplines)?

A major limitation of logical representations in real world applications is the implicit assumption that the background knowledge (BK) is perfect. This assumption is problematic when dealing with probabilistic phenomena, which is often the case. Probabilistic Logic Programming (PLP) is one ongoing effort to address this problem by extending the syntax and semantics of logic programs in order to have them represent and operate probability distributions (see [11]).

Answer Set Programming (ASP) [12] is a logic programming paradigm based on the stable model semantics of normal programs that can be implemented using the latest advances in SAT solving technology. Unlike ProLog, ASP is a truly declarative language that supports language constructs such as disjunction in the head of a clause, choice rules, and both hard and weak constraints.

Current systems for PLP, such as ProbLog [5], P-log [3], LP^MLN [6], or cplint [7], derive a unique probability distribution from the probabilistic facts of a Prolog-like program. However, if instead of Prolog we consider ASP with probabilistic facts, the characterization of a probability distribution on the program's domain is no more uniquely determined (see [1, 2, 3, 4]).

In our recent, yet unpublished, work [8] we address the problem of extending probability from the probabilistic facts of an (extended) ASP program to its stable models and, from there, to general events. Our approach is algebraic in the sense that it relies on an equivalence relation over the set of events and non-uniqueness is expressed by algebraic variables related by polynomial expressions. In that work we show how SASP can represent arbitrary bayesian networks and therefore express any probability distribution of discrete random variables.

This representation of arbitrary bayesian networks conferes to SASP the capability to deal with a very large collection of probability problems and tasks. However, the problem of obtaining such SASP, besides hand-coded, remains open. 

In our system some unknowns are represented by algebraic variables that can be estimated later from further information, e.g., evidence. This approach, delaying the assignment of these variables, enables later refinement and assigning a score to a partial program from additional evidence, measuring the error between the program's probability distribution and the empirical distribution from the evidence. 

In turn, scoring of SASP (i.e., models of probabilistic phenomena) is a feature that can be utilized with the application of evolutionary algorithms. From here we can explore how to induce SASP from BK and evidence, using the SASP score as a fitness function for the selection step in evolutionary algorithms.

The calculus of the score of an SASP with respect to evidence was already introduced and illustrated in [8]. It remains to investigate the application of this process to induction of SASP from BK and evidence. 

Ideas of this paper have a partial, limited, implementation, available in a public repository, that results from the work of a BII scholarship, supported by NOVALINCS "Financiamento Plurianual da unidade de I&D UIDP/04516/2020" and co-supported by Fundação para a Ciência e a Tecnologia (FCT), Portugal.

In the general Induction of Logic Programs (ILP) setting (see [11, 13]), the goal is to algorithmically obtain a (target) logic program consistent with BK and evidence. For that, (1) BK (e.g., obtained from experts) is provided in the form of a logic program, that describes objects and (first-order) relations of a domain and (2) observations are organized as positive evidence, that should be inferred from the target program, and negative evidence, that should not be inferred from the target program. Moreover, the target program must be (logically) consistent with the BK. ILP is a form of Machine Learning (ML) that offers significant advantages over numeric based ML. 

For one, ILP address the problem of Explainable Artificial Intelligence (XAI) because, unlike  the large-dimensional vector based models of numeric ML, logic programs are human-readable in the sense that their declarative nature describes what objects are in the domain, their structure, properties and relations.
Second, ILP describes phenomena with related instances while numeric ML is limited to a single (tabulated) relation where different instances (lines) are independent given the model. 
Third, often a target program is generated from a small set of observations, while, in general, numeric ML models require large datasets to achieve significant accuracy.
At last, expert knowledge, expressed in the BK, can be utilized to structure the target program, i.e., to model the observations. Again, this is a feature hard to achieve with numeric ML models.

Drawbacks of ILP include the computational complexity of inducing the target program and the general difficulty of logic programs to deal with data from probabilistic phenomena. While the later is being addressed by PLP in general and SASP in particular, the computational complexity of induction remains an important challenge that we propose to address with this project objectives.

We aim to continue our exploration, started in the work described in [8] and a BII scholarship, on how SASP represent probability distributions, how to use them to model probabilistic phenomena and how they can be induced from BK and evidence.

More specifically, this project's objectives are to investigate:

- The role of program structure and composition in the use of PASP to model probabilistic phenomena.
- Program transformation rules and space exploration algorithms for SASP.
- The performance of hand-coded and induced SASP models on selected theoretic and real world cases.

<!-- 
In summary, this project's objectives are:

- Induce SASP from BK and evidence, a form of machine learning that addresses the problem of Explainable Artificial Intelligence by producing structured, knowledge based, models.
- 
This is an ambitious objective that we plan to follow with this project by:

- Investigate the effects of program structure and composition in the use of PASP to model , (2) program transformation rules in task "Structure and Induction of SASP (SI)" and in tasks (3) "Integration with existing ASP and ILP software frameworks (INT)" and (4) "High Performance Computing for Induction and Use of SASP (HPC)". These tasks should provide software tools to use and induce SASP, the former task for general use and the former utilizing distributed HPC to speed-up and scale-up applications of SASP.  

Current systems ([3, 5, 6, 7]) adhere to a semantic of probabilistic logic programs different from ours. Therefore, it is necessary to provide a set of software tools to use and induce SASP.

Application state of the art and Objectives
-->


## Research plan and methods (10000) [DRAFT]

> In this section, the PI should describe the proposed research plan and the methodologies to be used, focusing on the following questions:
> - To what extent is the outlined scientific approach feasible bearing in mind the originality and/or ground-breaking potential of the proposed research?
> - To what extent are the proposed research methodology and working arrangements appropriate to achieve the goals of the project?
> - To what extent are the proposed timelines, resources, and PI´s commitment adequate and properly justified?
> 
> Funded projects will now have access to advanced computer resources and research data repositories provided by FCT without the need for further scientific evaluation. This includes computing time in FCT's two new supercomputers, Deucalion and MareNostrum 5. To this end, FCT kindly requests that applicants answer two simple yes/no additional questions:
> - Identify whether the work plan requires advanced computer resources to be provided by FCT.
> - Identify whether the work plan requires space in a research data repository to be provided by the FCT.

[DRAFT]

Feasibility and Originality

The outlined scientific approach leverages existing developments in Probabilistic Logic Programming (PLP) and Answer Set Programming (ASP) and extends it with the concept of Stochastic Answer Set Programs (SASP) to represent probability distributions in scenarios where traditional logical representations fall short due to probabilistic phenomena. The novelty lies in the application of algebraic methods to express uncertainty of and the integration of evolutionary algorithms for inducing SASP models. Feasibility is supported by previous work demonstrating the representational power of SASP. Originality is derived from the interpretation of PLP and ASP concepts, such as facts, of stable models and general event, with a new distribution semantic featuring unknown quantities that can be refined with evidence, and the proposed investigation into program induction from background knowledge and evidence.

Research Methodology

1. **Theoretical Analysis**: Conduct a thorough analysis of the role of program structure and composition in the utilization of PASP for modeling probabilistic phenomena. This involves investigating how different program structures impact the representation and inference capabilities of SASP.
   
2. **Algorithm Development**: Develop program transformation rules and space exploration algorithms tailored for SASP. This includes devising methods to efficiently transform SASP representations and explore the space of possible SASP models.
   
3. **Empirical Evaluation**: Evaluate the performance of both hand-coded and induced SASP models on a range of theoretical and real-world cases. This involves designing experiments to assess the accuracy, scalability, and computational efficiency of SASP models in comparison to existing PLP systems.
   
4. **Integration of Evolutionary Algorithms**: Investigate the application of evolutionary algorithms for refining SASP models based on additional background knowledge or evidence. Develop algorithms to update SASP parameters and structure to improve model fit to observed data.

Working Arrangements

- Collaborative Environment: Foster collaboration between researchers with expertise in logic, logic programming, and distributed systems to ensure interdisciplinary perspectives are considered.
  
- Regular Meetings: Schedule regular meetings (e.g., every three months) to discuss progress, address challenges, and align research efforts towards the project objectives.
  
- Access to Resources: Ensure human and computational resources for theoretical research, algorithm development, experimentation, and data analysis.

Timeline

1. Task Structure and Induction of SASP (SI) (Months 1-12)
   
  - Theoretical research on program structure and transformation rules conducted by an interdisciplinary team of four members, including the PI.
  - Identifications of relevant program structure and transformation rules.
  - Regular meetings and discussions to ensure progress and collaboration within the team.
  - Publication of research findings in two peer-reviewed international journals or presentations at international conferences.

2. Task Integration with existing ASP and ILP software frameworks (INT) (Months 3-15)
  
  - Implementation, testing, profiling and benchmarking, and documentation conducted by a post-doctoral researcher.
  - Translation of theoretical findings into practical algorithms and software tools.
  - Rigorous testing of implemented solutions to ensure correctness and efficiency.
  - Profiling to identify computation intensive points for improvement.
  - Benchmarking against existing methods to evaluate performance and identify areas for improvement.
  - Comprehensive documentation of the developed methodologies, including user guides and technical reports.
  - Continuous refinement based on feedback from internal testing and validation.
  - Publication of research findings in peer-reviewed international journals or presentations at international conferences.
  - Dissemination of outcomes through seminars, and open-source repositories.

3. ask Applications of SASP (APP) (Months 6-18)

  - Application of developed methodologies and software tools to theoretical and real-world problems.
  - Case studies and experiments conducted to assess the effectiveness and scalability of the proposed approaches.
  - Analysis of results and comparison with existing state-of-the-art methods.
  - Publication of research findings in peer-reviewed international journals or presentations at international conferences.
  - Dissemination of outcomes through seminars, and open-source repositories.

Resources

- Personnel

    - PI: Leads and coordinates all tasks, providing guidance and oversight throughout the project duration.
    - Interdisciplinary team (4 members, including the PI): Comprising experts in logic, logic programming, and distributed systems, responsible for theoretical research and case exploration.
    - Post-doctoral researcher: Leads the implementation, testing, benchmarking, and documentation efforts.

- Equipment and Infrastructure

    - High-performance computing resources for conducting complex simulations and experiments. For example, High Performance Computing Chair's OBLIVION super-computer.
    - Software development tools and platforms for coding, testing, and version control.
    - Access to relevant databases, datasets, and computational libraries for validation and benchmarking.

- Funding

    - Budget allocation for equipment procurement, travel expenses, publication fees, and other project-related costs.
    - Grant funding to sustain the research and software tools development activities over the designated timeline.

PI Commitment

As the Principal Investigator (PI), I am fully committed to overseeing and ensuring the success of each phase of the research project. My responsibilities include:

- Providing strategic direction and vision for the research activities.
- Facilitating interdisciplinary collaboration among team members.
- Securing necessary resources and funding to support the project goals.
- Monitoring progress and addressing any challenges or setbacks that may arise.
- Ensuring compliance with ethical guidelines and research protocols.
- Contributing to the dissemination of research outcomes through publications, presentations, and knowledge sharing initiatives.
- Mentoring and supporting team members to foster their professional development and growth.
  
Throughout the project duration, I will maintain open communication channels with all  team members, funding agencies, and collaborators, to ensure transparency and alignment with project objectives. My dedication to the project's success is unwavering, and I am committed to achieving impactful results that advance the field of probabilistic logic programming and inductive logic programming.

Justification

The proposed research methodology aligns with the project's objectives by combining theoretical analysis, algorithm development, empirical evaluation, and interdisciplinary collaboration. The utilization of existing PLP frameworks as a foundation and the integration of evolutionary algorithms introduce innovative elements to address the challenges of data with random perturbations and computational complexity in logic-based probabilistic reasoning. The allocated timelines, resources, and PI's commitment are justified by the ambitious nature of the research objectives and the potential impact of the proposed advancements in probabilistic logic programming.


## Bibliographic References (10000) [DRAFT]

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
11. Riguzzi, F. (2022). Foundations of probabilistic logic programming: Languages, semantics, inference and learning. River Publishers.
12. Lifschitz, V. (2002). Answer set programming and plan generation. Artificial Intelligence, 138(1-2), 39-54.
13. Russell, S. J., & Norvig, P. (2010). Artificial intelligence a modern approach. London.

## Past publications [DRAFT]

[1] Körner, P., Leuschel, M., Barbosa, J., Costa, V.S., Dahl, V., Hermenegildo, M.V., Morales, J.F., Wielemaker, J., Diaz, D., Abreu, S. and Ciatto, G. (2022). Fifty years of Prolog and beyond. Theory and Practice of Logic Programming, 22(6), 776-858.
[2] Codognet, Philippe, Daniel Diaz, and Salvador Abreu. "Quantum and Digital Annealing for the Quadratic Assignment Problem." 2022 IEEE International Conference on Quantum Software (QSW). IEEE, 2022.
[3] Eloy, Eduardo, Vladimir Bushenkov, and Salvador Abreu. "Constraint Modeling for Forest Management." International Conference on Dynamic Control and Optimization. Cham: Springer International Publishing, 2021.
[4] López, Jheisson, et al. "Weaving of metaheuristics with cooperative parallelism." Parallel Problem Solving from Nature-PPSN XV: 15th International Conference, 2018, Proceedings, Part I 15. Springer International Publishing, 2018.
[5] Codognet, P., Munera, D., Diaz, D. and Abreu, S., 2018. Parallel local search. Handbook of parallel constraint reasoning, pp.381-417

## Tasks [DRAFT]

### Structure and Induction of SASP (SI) [DRAFT]

- Task description and expected results (4000)
  
    Objectives

    Understand the role of Stochastic Answer Set Programs (SASP) structure and composition elements (e.g., stratified or recursive  programs, functional symbols) on the stable models, event classes, respective probability and SASP scoring with respect to evidence (i.e., a dataset).
    
    Understand what are the best choices for program transformation and combination rules for induction of SASP from Background Knowledge (BK) and evidence using evolutionary program space exploration algorithms (e.g., genetic algorithms).
  
    Methodologies and approaches

    List structure elements (e.g., stratified programs, recursive rules, functional symbols) and explore the respective effects on the stable models and event classes.
    
    Modify the definition of event classes and study the effect on event probability and score function in modeling probabilistic processes
    
    Define SASP transformation and combination rules to study and characterize the resulting properties of evolutionary program space exploration algorithms for the induction of SASP from BK and evidence. 
  
    Expected results

    Assessment on the effects of SASP structures and composition elements on stable models, event classes, respective probability and SASP scoring with respect to evidence for the use of SASP in modeling probabilistic processes.
    
    Assessment of SASP transformation and combination rules and the resulting properties of evolutionary program space exploration algorithms for the induction of SASP from BK and evidence.
  
    Preconditions from other tasks: None. This is an initial task, a continuation of previous research.
  
    Results to other tasks

    Expected result of this task gives important insights into:
        To tasks INT and APP
        The use of SASP in modeling probabilistic processes, because it studies the elements utilized in the computation of the event classes and respective probabilities.
        The induction of SASP from BK and evidence, because it studies program transformation and combination rules utilized in evolutionary program space exploration algorithms.
  
    Role of each partner and institution:
    
    Universidade de Évora: Principal contractor;

    Francisco Coelho's expertise in Informatics and AI, coupled with his extensive teaching and research experience, qualifies him to investigate SASP structures and their role in probabilistic modeling. His contributions to logic and statistical AI ensure insightful analysis of SASP transformation rules. The expected results will deepen understanding of SASP's applicability in modeling probabilistic processes.

    With expertise in proof theory and logic, Bruno Dinis is well-equipped to analyze SASP structures and transformation rules. His research background ensures insightful assessment of SASP's role in logic modeling, contributing to advancements in algorithmic induction methodologies.

    Salvador Abreu's vast experience in informatics, leadership in research, and project management make him invaluable for analyzing SASP structures. His insights will enhance understanding of SASP's role in probabilistic modeling and optimize induction methodologies.
  
  - Justification for the resources:
    For deliverable "SI Paper 1": A member should present the results of this task in an international, peer-review, conference or journal.
    For deliverable "SI Paper 2": A member should present the results of this task in an international, peer-review, conference or journal.

- Member   Person*month
    Francisco Coelho    2,00
    Bruno Dinis         2,00
    Salvador Abreu      1,00

- StartDate Duration
    2024-09-01  12

- Deliverables and delivery dates (2500)
  Paper accepted in international conference or journal, by 2025-03-01
  Paper accepted in international conference or journal, by 2025-09-01

- Budgets (2500)
  Registration in international conference (x2)....1400.00€
  Travel to international conference (x2)..........1000.00€
  Per diem international conference (x3x2).........1152.00€

- Amount requested for the task 
  4440.00€

### Integration with existing ASP and ILP software frameworks (INT) [DRAFT]

- Task description and expected results (4000)
  
    Objectives

    Support the application of SASP for modeling probabilistic processes and induce SASP from Background Knowledge (BK) and evidence.
  
    Methodologies and approaches

    Implementation (i.e., writing code according to the software design specifications), testing (i.e., verification that the implemented software functions correctly and meets the requirements outlined in the design phase), profiling (i.e., analyzing the performance of the software system to identify bottlenecks, memory leaks, and other performance issues), benchmarking (i.e., compare the performance of the software system against standard benchmarks or competitors' products) and documenting (i.e., providing comprehensive information about the software system, including its purpose, features, architecture, installation instructions, and usage guidelines): 
        SASP intermediate representation and a parser.
        Integration with existing, state of the art, Answer Set Program (ASP) tools such as Potassco and cplint for the computation of the stable models.
        Instrumental functions such as: event belongs to class, class probability, event probability.
        Support for SASP combination and transformation.
        Integration with existing, state of the art, evolutionary explorations tools (e.g. genetic algorithms).
        Command-line programs to support basic usage such as: list classes, query the probability of an event or class, induce SASP.
  
    Expected results

    A basic set of tools, including a library and command-line programs, to use Stochastic Answer Set Programs (SASP) for modeling probabilistic processes and induce SASP from Background Knowledge (BK) and evidence.
  
    Preconditions from other tasks

    From task SI, 
        Insights on the relation of SASP structure and composition elements and the computation of classes, and element and class probability.
        Insights on the effects of SASP transformation and combination rules on evolutionary program space exploration algorithms.
  
    Results to other tasks
    
    The software tools required by task APP to use and/or induce SASP on large problems.  
  
    Role of each partner and institution

    Universidade de Évora: Principal contractor.

    Francisco Coelho, PhD in Informatics, specializes in AI and mathematics. As Assistant Professor at Universidade de Évora, he aims to support SASP application by developing a robust toolset, ensuring effective probabilistic modeling through integration, instrumentation, and evolutionary exploration.

    The post-doc student will implement, test, profile, benchmark, and document software for SASP application. Integration with existing ASP tools, instrumental functions, and evolutionary exploration will ensure effective probabilistic modeling. The expected outcome is a comprehensive SASP toolset for modeling and inference.
  
    Justification for the resources
    
    The implementation volume and complexity requires a full-time post-doc student working over a year, using a suitable laptop.
    The student should present the results of this task in an international conference or journal.
    

- Member   Person*month
  
  Francisco Coelho   2,00
  Post-doc Student  12,00

- StartDate Duration

    2024-12-01  12

- Deliverables and delivery dates (2500)
    
    A report on progress, documenting the implementation, testing, benchmarking and documentation of the tools, by 2025-06-01.
    Paper accepted in international conference or journal, by 2025-12-01.

- Budgets (2500)

  Registration in international conference.......700.00€
  Travel to international conference.............500.00€
  Per diem international conference (x3).........576.00€
  Laptop (i7, 32GB ram, 1TB SSD, 15")...........2660.00€
  Post-doc scholarship (BPD) (12 x 1686,00€)...20232.00€

- Amount requested for the task 
  30835.00€

### Applications of SASP (APP) [DRAFT]

- Task description and expected results (4000)    
    Objectives

    Use Stochastic Answer Set Programs (SASP) for modeling probabilistic processes and induce SASP from Background Knowledge (BK) and evidence in the context of theoretic scenarios (toy problems) described in the relevant literature (e.g., Stochastic Plan Generation, Logic/Statistic Puzzles) as well as to a selected real-world cases, including modelling resource allocation in distributed, high performance computing systems.

    Methodologies and approaches

    Compile a set of theoretic and real-world problems, including resource allocation in distributed, high performance computing systems.
    Gather information in the form of background knowledge (e.g., from experts) and data (positive and negative examples) on selected problems.
    Evaluate the performance of hand-coded and induced SASP models on that set of problems.
    Compare with state-of-the-art results.

    Expected results

    Assessment of the performance of hard-coded and induced SASPs on selected theoretical and real-world problems, with focus on resource allocation in distributed, high performance computing systems.
    Hard-coded or induced models of the addressed cases.
    A list of advantages and problems in the application of SASP.
  
    Preconditions from other tasks

    From task SI:
      Insights on the relation of SASP structure and composition elements and the computation of classes, and element and class probability.
      Insights on the effects of SASP transformation and combination rules on evolutionary program space exploration algorithms.
    From task INT:
        Libraries, programs, and respective documentation. 
  
    Results to other tasks
      None. This is a final task.
  
    Role of each partner and institution

    Universidade de Évora: Principal contractor.

    High Performance Computing Chair: Research unit.

    Francisco Coelho's vast experience in informatics, mathematics, and AI makes him instrumental in SASP modeling. His supervision ensures rigorous evaluation, leading to insights into SASP's applicability and challenges.

    Salvador Abreu's expertise in informatics and extensive project involvement make him pivotal for SASP modeling. His leadership will ensure thorough problem compilation, data gathering, and performance evaluation, yielding insights into SASP's effectiveness.

    Miguel Avillez’s profound expertise in astrophysics and high-performance computing is vital for SASP modeling. His leadership ensures comprehensive problem evaluation and performance assessment, yielding insights into SASP’s applicability and limitations.
  
    Justification for the resources

    A member should present the results of this task in an international, peer-review, conference or journal.
    

- Member   Person*month
  
Francisco Coelho    2,00
Salvador Abreu      1.00
Miguel Avillez      1.00

- StartDate Duration

2025-03-01  12

- Deliverables and delivery dates (2500)
    
A report on progress, documenting the performance of the hand-coded and induced PASP models on the selected problems, by 2025-09-01.
A paper accepted in an international conference or journal, by 2026-03-01.

- Budgets (2500)

Registration in international conference......1400.00€
Travel to international conference............1000.00€
Per diem international conference (x3)........1152.00€

- Amount requested for the task 
  4440€

## Project timeline and management [DRAFT]

### Milestones list (<= 6) [DONE]

SI Paper 1:
  - 2025-03-01
  - SI Paper 1
  - A paper accepted in an international conference or journal, describing the effects of structures and composition elements on SASP on stable models, event classes, and respective probability.
  - SI

SI Paper 2:
  - 2025-09-01
  - SI Paper 2
  - A paper accepted in an international conference or journal, describing program transformation rules and space exploration algorithms for SASP.
  - SI

INT Report:
  - 2025-06-01
  - INT Report
  - A report on progress, documenting the implementation, testing, benchmarking and documentation of the tools.
  - INT

INT Paper:
  - 2025-12-01
  - INT Paper
  - A paper accepted in an international conference or journal, describing the performance of the implemented tools on hand-coded and induced SASP.
  - INT

APP Report:
  - 2025-09-01
  - APP Report
  - A report on progress, documenting the performance of the hand-coded and induced PASP models on selected problems.
  - APP

APP Paper:
  - 2026-03-01
  - APP Paper
  - A paper accepted in an international conference or journal, documenting the performance of the hand-coded and induced PASP models on selected problems.
  - APP

### Timeline [DONE]

(Use the spreadsheet)

### Management (3000) [DRAFT]

> in this section, the PI should include a description of the project management structure to be adopted, in particular the coordination between participants, the meetings planned and the reporting structure. The proposed structure will depend on the size of the project and, in particular, the existence of participants from different research units.

[DRAFT]

**Project Management Structure:**

1. **Coordination Between Participants:**
   - **Principal Investigator (PI):**
     - Leads the overall project and ensures alignment with objectives.
     - Facilitates communication between participants from different research units.
     - Provides guidance and support to team members.

   - **Researchers:**
     - Collaborate closely with the PI to execute project tasks.
     - Coordinate with each other to ensure seamless progress on individual and collaborative activities.
     - Contribute expertise from their respective research units to enhance project outcomes.

   - **Postdoctoral Student:**
     - Works closely with the PI and researchers to implement project tasks.
     - Collaborates with other team members to integrate research findings into software tools and algorithms.

2. **Meetings Planned:**
   - **Quarterly Team MeetingsQuarterly Team Meetings:**
     - Frequency: Once every three months.
     - Purpose: Discuss progress, challenges, and next steps for the quarter; Provide a comprehensive overview of progress across all project tasks.
     - Agenda: Review individual tasks, share updates, address any issues or roadblocks; Review achievements, challenges, and goals for the upcoming month.
   
   - **Semiannual Review Meetings:**
     - Frequency: Once every six months.
     - Purpose: Conduct a detailed review of project milestones and objectives.
     - Agenda: Evaluate progress, identify any necessary adjustments to the research plan, discuss potential collaborations or partnerships.

3. **Reporting Structure:**
   - **Progress Reports:**
     - Format: Written reports submitted every three months by each team member.
     - Content: Summarize achievements, challenges, and goals for the upcoming month.
     - Submission: Due one week prior to the Quarterly Team Meetings.
   
   - **Semiannual Review Reports:**
     - Format: Comprehensive reports submitted by the PI summarizing progress and outcomes over the past six months.
     - Content: Review achievements, challenges, adjustments to the research plan, and any recommendations for the future.
     - Submission: Due one week prior to the Semiannual Review Meetings.

5. **Project Management Tools:**
   - Maintain shared documentation and repositories for research materials, code, and datasets to ensure accessibility and transparency among team members.

Financial and Administrative Management

The Administrative Services of the University of Évora are responsible for project's financial and administrative management, through its Projects Management Division (DGP). This office is organized in two areas: (i) financial contracts and administrative management and (ii) administrative support to R&D units. They are deep experienced in managing several different financial programs such as Portuguese Government Structural Funds (Portugal 2020, FCT) and Community Funds, such as Erasmus+, H2020, HORIZON EUROPE or Creative Europe.

It is DGP's main task to fulfill all the necessary operations, provide administrative support and reassure the good execution of R&D Units budgets and respective Projects. Furthermore, it is accountable for the execution of all legal and required financial reports.

Each project is the responsibility of a project officer with expertise and experience in project management and finance. The project officer acts as a link between the Responsible Researcher and the rest of the financial team. Is also responsible to process all expenses fulfilling all the current national and European legislations.

The project officer is also in charge of the liaison with FCT (Science and Technology National Agency), European Commission and other donors by elaborating and delivering the financial reports and respective requests for payments, including reassuring all necessary procedures to the validation of expenditures.

The University of Évora owns an information system that allows the researcher to follow the project's financial implementation on a permanent basis.

## Ethical issues [DONE]

## 2030 Agenda (3000) [DONE]

> The Sustainable Development Goals (SDGs) and the 2030 Agenda, adopted by almost all countries in the world, in the context of the United Nations, define the priorities and aspirations of global sustainable development for 2030 and seek to mobilize global efforts around a set of common goals and objectives.
> 
> There are 17 SDGs, in areas that affect the quality of life of all citizens of the world and those who are yet to come.
> 
> In this section the PI should identify one, or up to a maximum of three, of the 17 Sustainable Development Goals of the United Nations 2030 Agenda and justify how the application fits into the selected SDGs.


SDG Goal 9: Industry, Innovation and Infrastructures

Framework justification (3000)

Application of this project include the optimization in the use of existing infrastructure, therefore in accordance to Target 9.b: Support domestic technology development, research and innovation in developing countries, including by ensuring a conducive policy environment for, inter alia, industrial diversification and value addition to commodities. Indicator 9.b.1: Proportion of medium and high-tech industry value added in total value added.

## Other projects [DONE]

- JuPy
  - Project Reference: CPCA/A0/427668/2021
  - PI: Francisco Coelho
  - Project Status: completed
  - Project Title: JuPy | High Level Languages on HPC
  - Principal contractor: High Performance Computing Chair
  - Funding Entity: Fundação para a Ciência e a Tecnologia - FCT, I.P.
  - Total funding: 185,00€
  - Start date: 2022-01-21
  - Duration (months): 3
  - Main objectives:
    - Knowledge and experience acquired about implementing and executing programs in a distributed HPC system.
    - Technical and scientific cooperation relationships established between the PI and the management team of the "Oblivion | HPCUE" cluster.

## Attachments [DONE]

