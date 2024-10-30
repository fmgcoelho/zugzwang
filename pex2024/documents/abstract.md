# Abstract (5000)

> In this section, the summary of the proposal should be presented, in Portuguese and English, with an analysis of the state of the art, the main goals to be addressed, the knowledge and skills available in the group, the strategy and methodologies to be used, identifying the novelty and the expected results. 
> 
> The PI must indicate whether the abstract to be used by the FCT for public disseminating will be the same as the abstract previously filled  in. If, for confidentiality reasons, the text of the abstract for publication purposes is different, the PI should click on the button Abstract for publication different. The content of this field will always be the PI's responsibility.


---

Consider the state of the art, the research plan, and the objectives given below an present the summary, with an analysis of the state of the art, the main goals to be addressed, the knowledge and skills available in the group, the strategy and methodologies to be used, identifying the novelty and the expected results.

The state of the art is:

A major limitation of logical representations in real world applications is the implicit assumption that the background knowledge (BK) is perfect. This assumption is problematic when data is subject to probabilistic phenomena, which is often the case. Probabilistic Logic Programming (PLP) is one ongoing effort to address this problem by extending the syntax and semantics of logic programs in order to have them represent and operate probability distributions (see [11]). 

Current systems for PLP, such as ProbLog [5], P-log [3], LP^MLN [6], or cplint [7], derive a probability distribution from a program. However, for Answer Set Programs (ASP) [12] with probabilistic facts, the characterization of a probability distribution on the program's domain is not straightforward (see [1, 2, 3, 4]).

In [8] we address the problem of extending probability from the total choices of an ASP program to its stable models and, from there, to general events. Our approach is algebraic in the sense that it relies on an equivalence relation over the set of events and uncertainty is expressed with variables and polynomial expressions. In that work we show how SASP can represent arbitrary bayesian networks and therefore express any probability distribution of discrete random variables.

This representation of arbitrary bayesian networks conferes to SASP the capability to deal with a very large collection of probability problems and tasks. However, the problem of obtaining such SASP, besides hand-coded, remains open. 

In our system some unknowns are represented by numeric parameters that can be estimated later from further information, e.g., evidence. This approach, delaying the assignment of certain parameters, enables later refinement and scoring a partial program from additional evidence. 

In turn, scoring of SASP (i.e., models of a probabilistic phenomenon) is a key feature required to the application of evolutionary algorithms. From here we can explore how to induce SASP from BK and evidence.

The calculus of the score of an SASP with respect to evidence was already introduced and illustrated in [8]. It remains to investigate the application of this process to induction of SASP from BK and evidence. 

Ideas of this paper have a partial, limited, implementation, available in a public repository, that results from the work of a BII scholarship, supported by NOVALINCS "Financiamento Plurianual da unidade de I&D UIDP/04516/2020" and co-supported by Fundação para a Ciência e a Tecnologia (FCT), Portugal.

In the general Induction of Logic Programs (ILP) setting (see [11, 13]) the goal is to algorithmically obtain a (target) logic program. For that, (1) BK (e.g., obtained from experts) is provided in the form of a logic program, describing objects and (first-order) relations of a domain and (2) observations are organized as positive evidence, that should be inferred from the target program, and negative evidence, that should not be inferred from the target program. Moreover, the target program must be (logically) consistent with the BK. ILP is a form of Machine Learning (ML) that offers significant advantages over numeric based ML. 

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

The Research plan and methodologies is


Feasibility and Originality

The outlined scientific approach leverages existing developments in Probabilistic Logic Programming (PLP) and Answer Sep Programming (ASP) and extends it with the concept of Stochastic Answer Set Programs (SASP) to represent probability distributions in scenarios where traditional logical representations fall short due to probabilistic phenomena. The novelty lies in the application of algebraic methods to express uncertainty and the integration of evolutionary algorithms for inducing SASP models. Feasibility is supported by previous work demonstrating the representational power of SASP. Originality is derived from the interpretation of PLP and ASP concepts in a novel semantic, and the proposed investigation into program induction from background knowledge and evidence.

Research Methodology

1. **Theoretical Analysis**: Conduct a thorough analysis of the role of program structure and composition in the utilization of PASP for modeling probabilistic phenomena. This involves investigating how different program structures impact the representation and inference capabilities of SASP.
   
2. **Algorithm Development**: Develop program transformation rules and space exploration algorithms tailored for SASP. This includes devising methods to efficiently transform SASP representations and explore the space of possible SASP models.
   
3. **Empirical Evaluation**: Evaluate the performance of both hand-coded and induced SASP models on a range of theoretic and real-world cases. This involves designing experiments to assess the accuracy, scalability, and computational efficiency of SASP models in comparison to existing PLP systems.
   
4. **Integration of Evolutionary Algorithms**: Investigate the application of evolutionary algorithms for refining SASP models based on additional background knowledge or evidence. Develop algorithms to update SASP parameters and structure to improve model fit to observed data.

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


---

## Abstract

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

## Sumário

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
    A colaboração numa equipe interdisciplinar garante diversas perspetivas.

Estratégia e Metodologias
    A análise teórica explorará os efeitos da estrutura dos programas SASP na modelação de fenómenos probabilísticos.
    O desenvolvimento de algoritmos será focado on uso de SASP para a modelação de fenómenos probabilísticos e indução indução de modelos SASP.
    A avaliação empírica irá apurar o desempenho dos modelos em vários casos.
    A colaboração interdisciplinar promove a inovação e garante pesquisas abrangentes.

Novidade e resultados esperados
    A novidade está na semântica probabilística do SASP, na pontuação resultante baseada em evidências e na utilização dessa pontuação para induzir SASP a partir de conhecimento anterior e evidência.
    Os resultados esperados incluem melhor compreensão da modelação SASP, algoritmos eficientes e modelos SASP validados.

No geral, a pesquisa proposta aborda limitações críticas na programação lógica probabilística com ASP e visa avançar através de metodologias inovadoras e colaboração interdisciplinar. O plano de investigação abrangente, apoiado pelos conhecimentos e recursos existentes, demonstra um forte potencial para contribuições significativas para esse problema.