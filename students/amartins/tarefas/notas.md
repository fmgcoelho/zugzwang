# Notas com Alice Martins

## 2024-01-30

### Estrutura do Relatório

1. Introdução - programação lógica; redes bayesianas; programação lógica probabilística. Ferramentas. Problema
2. Desenvolvimento
   1. Exposição - desenvolvimento
   2. Crítica positiva - testes, documentação, funcionalidade
   3. Crítica negativa
3. Conclusões
   1. Balanço do que foi feito, comparando os +/-, 
   2. visão de problemas a resolver e outras tarefas futuras.

## 2023-05-04

### Problemas

#### Tarefa 1A

1. Está a contar os nós "in" e os nós "out" ao contrário, certo? `len(children)`  diz quantas arestas saem de `x`. 
2. Em 
    ```python    
    if len(parents) != 0:
        asc += 1
    if len(children) != 0:
        des += 1
    ```
    deve ser
    ```python    
    if len(parents) != 0:
        des += 1
    if len(children) != 0:
        asc += 1
    ```
    porque o nó `x` é (mais) um descendente se tem ascendentes (e igualmente para ascendente).

#### Tarefa 1B

1. Não deve misturar o código para definir o grafo `G` com o código para o grafo `dot`. **Exceto** se quiser percorrer apenas uma vez `model.nodes` e `model.edges`. 
 
### Sugestões

- **Use sempre, e só, o inglês no seu código**, não só porque não se podem usar acentos, como `nós_in`, mas também porque misturar português com inglês fica estranho (isto é, _feio_!). É melhor `nodes_in` do que `nos_in`.  
- Use nomes descritivos nas suas variáveis: `node` em vez de `x`.
- Em vez de `asia = bn.import_DAG("asia2.bif")` talvez `dag = bn.import_DAG("asia2.bif")` seja melhor (**porquê?**)
- O código também fica mais simples se usar "f-strings": Em vez de 
    ```python
    print("Número de nós:", len(nos))
    ```
    use 
    ```python
    print(f"Número de nós: {len(nos)}")
    ```
### Desafios

1. **Torne o seu código geral.** 
   1. Coloque a parte essencial da tarefa 1A numa função, `summary_dag(filename)`, que tem argumento uma `string` com o nome do ficheiro e devolve um `dict` com chaves `dag_file`, `nodes`, `count_parents`, `count_children`, `count_in_edges`, `count_out_edges`. 
   2. Use uma função `summary_str(d)` que tem argumento um `dict` como acima e devolve uma `string` com as perguntas e as respostas "bem formatadas". Por exemplo:
    ```text
    DAG file:               asia2.bif
        Number of nodes:    8
        Number of parents:  6
        Number of children: 6
        Average in-degree:  1.0
        Average out-degree: 1.0
        Nodes:
            asia
            tub
            ...
    ```
   3. Por fim, combine as duas funções:
        ```python
        summary = summary_dag("asia2.bif")
        message = summary_str(summary)
        print(message)
        ```
   4. Coloque a parte essencial da tarefa 1B em funções `show_dag(model)` e `save_dag(model, target_filename)`.
2. **A biblioteca `bnlearn` é excessiva para estas tarefas.** Não só precisa de várias dependências irrelevantes para o que pretendemos, por exemplo o `pytorch`, como demora imenso tempo a ler o ficheiro. _Procure uma alternativa mais simples._ (**n.b.** não sei se existe!)