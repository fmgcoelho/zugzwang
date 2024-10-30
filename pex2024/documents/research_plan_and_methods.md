# Research plan and methods

> In this section, the PI should describe the proposed research plan and the methodologies to be used, focusing on the following questions:
> - To what extent is the outlined scientific approach feasible bearing in mind the originality and/or ground-breaking potential of the proposed research?
> - To what extent are the proposed research methodology and working arrangements appropriate to achieve the goals of the project?
> - To what extent are the proposed timelines, resources, and PI´s commitment adequate and properly justified?
> 
> Funded projects will now have access to advanced computer resources and research data repositories provided by FCT without the need for further scientific evaluation. This includes computing time in FCT's two new supercomputers, Deucalion and MareNostrum 5. To this end, FCT kindly requests that applicants answer two simple yes/no additional questions:
> - Identify whether the work plan requires advanced computer resources to be provided by FCT.
> - Identify whether the work plan requires space in a research data repository to be provided by the FCT.

---

Consider the following state of the art and describe a research plan and the methodologies to be used, focusing on the following questions:

- To what extent is the outlined scientific approach feasible bearing in mind the originality and/or ground-breaking potential of the proposed research?

- To what extent are the proposed research methodology and working arrangements appropriate to achieve the goals of the project?

- To what extent are the proposed timelines, resources, and PI´s commitment adequate and properly justified?

The state of the art is:

A major limitation of logical representations in real world applications is the implicit assumption that the background knowledge (BK) is perfect. This assumption is problematic if data is noisy, which is often the case. Probabilistic Logic Programming (PLP) is one ongoing effort to address this problem by extending the syntax and semantics of logic programs in order to have them represent and operate probability distributions. 

Current systems for PLP, such as ProbLog, P-log, LP^MLN, or cplint, derive a probability distribution from a program. However, for Answer Set Programs (ASP)  with probabilistic facts, the characterization of a probability distribution on the program's domain is not straightforward .

In a previous work we address the problem of extending probability from the total choices of an ASP program to its stable models and, from there, to general events. Our approach is algebraic in the sense that it relies on an equivalence relation over the set of events and uncertainty is expressed with variables and polynomial expressions. In that work we show how SASP can represent arbitrary bayesian networks and therefore express any probability distribution of discrete random variables.

This representation of arbitrary bayesian networks conferes to SASP the capability to deal with a very large collection of probability problems and tasks. However, the problem of obtaining such SASP, besides hand-coded, remains open. 

In our system some unknowns are represented by numeric parameters that can be estimated later from further information, e.g., evidence. This approach, delaying the assignment of certain parameters, enables later refinement and scoring a partial program from additional evidence. 

In turn, scoring of SASP (i.e., models of a probabilistic phenomenon) is a key feature required to the application of evolutionary algorithms. From here we can explore how to induce SASP from BK and evidence.

The calculus of the score of an SASP with respect to evidence was already introduced and illustrated in . It remains to investigate the application of this process to induction of SASP from BK and evidence. 

Ideas of this paper have a partial, limited, implementation, available in a public repository.

In the general Induction of Logic Programs (ILP) setting the goal is to algorithmically obtain a (target) logic program. For that, (1) BK (e.g., obtained from experts) is provided in the form of a logic program, describing objects and (first-order) relations of a domain and (2) observations are organized as positive evidence, that should be inferred from the target program, and negative evidence, that should not be inferred from the target program. Moreover, the target program must be (logically) consistent with the BK. ILP is a form of Machine Learning (ML) that offers significant advantages over numeric based ML. 

For one, ILP address the problem of Explainable Artificial Intelligence (XAI) because, unlike  the large-dimensional vector based models of numeric ML, logic programs are human-readable in the sense that their declarative nature describes what objects are in the domain, their structure, properties and relations.
Second, ILP describes phenomena with related instances while numeric ML is limited to a single (tabulated) relation where different instances (lines) are independent given the model. 
Third, often a target program is generated from a small set of observations, while, in general, numeric ML models require large datasets to achieve significant accuracy.
At last, expert knowledge, expressed in the BK, can be utilized to structure the target program, i.e., to model the observations. Again, this is a feature hard to achieve with numeric ML models.

Drawbacks of ILP include the computational complexity of inducing the target program and the general difficulty of logic programs to deal with data with random perturbations. While the later is being addressed by PLP in general and SASP in particular, the computational complexity of induction remains an important challenge that we propose to investigate with this project.

In summary, with this project we aim to continue our exploration on how SASP represent probability distributions, how to use them to model probabilistic phenomena and how they can be induced from BK and evidence.

More specifically, this project's objectives are to investigate:

- The role of program structure and composition in the use of PASP to model probabilistic phenomena.
- Program transformation rules and space exploration algorithms for SASP.
- The performance of hand-coded and induced SASP models on selected theoretic and real world cases.

---

### Research Plan and Methodologies

Feasibility and Originality

The outlined scientific approach leverages existing developments in Probabilistic Logic Programming (PLP) and Answer Set Programming (ASP) and extends it with the concept of Stochastic Answer Set Programs (SASP) to represent probability distributions in scenarios where traditional logical representations fall short due to probabilistic phenomena. The novelty lies in the application of algebraic methods to express uncertainty and the integration of evolutionary algorithms for inducing SASP models. Feasibility is supported by previous work demonstrating the representational power of SASP. Originality is derived from the interpretation of PLP and ASP concepts in a novel semantic, and the proposed investigation into program induction from background knowledge and evidence.

Research Methodology

1. **Theoretical Analysis**: Conduct a thorough analysis of the role of program structure and composition in the utilization of PASP for modeling probabilistic phenomena. This involves investigating how different program structures impact the representation and inference capabilities of SASP.
   
2. **Algorithm Development**: Develop program transformation rules and space exploration algorithms tailored for SASP. This includes devising methods to efficiently transform and combine SASP representations and explore the space of possible SASP models.
   
3. **Empirical Evaluation**: Evaluate the performance of both hand-coded and induced SASP models on a range of theoretic and real-world cases. This involves designing experiments to assess the accuracy, scalability, and computational efficiency of SASP models in comparison to existing PLP systems.
   
4. **Integration of Evolutionary Algorithms**: Investigate the application of evolutionary algorithms for induction of SASP models based on additional background knowledge and evidence. Develop algorithms to update SASP parameters and structure to improve model fit to observed data.

Working Arrangements

- Collaborative Environment: Foster collaboration between researchers with expertise in logic, logic programming, and distributed systems to ensure interdisciplinary perspectives are considered.
  
- Regular Meetings: Schedule regular meetings (e.g., every three/four months) to discuss progress, address challenges, and align research efforts towards the project objectives.
  
- Access to Resources: Ensure human and computational resources for theoretical research, algorithm development, experimentation, and data analysis.

Timeline

1. Task Structure and Induction of SASP (SI) (Months 1-12)
   
  - Theoretical research on program structure and transformation rules conducted by an interdisciplinary team of four members, including the PI.
  - Identifications of relevant program structure and transformation rules.
  - Regular meetings and discussions to ensure progress and collaboration within the team.
  - Publication of research findings in peer-reviewed international journals or presentations at international conferences.

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

    - High-performance computing resources for conducting complex simulations and experiments.
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
  
Throughout the project duration, I will maintain open communication channels with all stakeholders, including team members, funding agencies, and collaborators, to ensure transparency and alignment with project objectives. My dedication to the project's success is unwavering, and I am committed to achieving impactful results that advance the field of probabilistic logic programming and inductive logic programming.

Justification

The proposed research methodology aligns with the project's objectives by combining theoretical analysis, algorithm development, empirical evaluation, and interdisciplinary collaboration. The utilization of existing PLP frameworks as a foundation and the integration of evolutionary algorithms introduce innovative elements to address the challenges of data with random perturbations and computational complexity in logic-based probabilistic reasoning. The allocated timelines, resources, and PI's commitment are justified by the ambitious nature of the research objectives and the potential impact of the proposed advancements in probabilistic logic programming.