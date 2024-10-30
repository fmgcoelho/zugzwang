import bnlearn as bn

asia = bn.import_DAG("asia2.bif")

model = asia['model'] # Cria um objeto BayesianModel



nos = model.nodes()
print("Número de nós:", len(nos))        #resposta à pergunta "quantos nós tem a rede?"

print("Lista de nós:", nos)

nos_in = 0
nos_out = 0

for x in nos:
    # Obtem os nós pais e filhos de cada nós
    parents = model.get_parents(x)
    children = model.get_children(x)
    #resposta à pergunta "quantos nós são descendentes? quantos são ascendentes?"
    print("Pais de ", x, ": ", parents)
    print("Filhos de ", x, " :", children)
    nos_in += len(children)
    nos_out += len(parents)

# resposta à pergunta "qual é o número médio de arestas "in"? e "out"?"
nos_in = nos_in/len(nos)
nos_out = nos_out/len(nos)
print("Número médio de arestas in: ", nos_in)
print("Número médio de arestas out: ", nos_out)