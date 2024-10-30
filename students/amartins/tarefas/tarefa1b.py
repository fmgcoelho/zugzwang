import bnlearn as bn
import networkx as nx
import pydot
from networkx.drawing.nx_pydot import graphviz_layout

asia = bn.import_DAG("asia2.bif")
model = asia['model']

# DiGraph do networkx
G = nx.DiGraph()

for node in model.nodes:
    G.add_node(node)

for edge in model.edges:
    G.add_edge(edge[0], edge[1])

# objeto pydot
dot = pydot.Dot(graph_type='digraph')

for node in model.nodes:
    dot.add_node(pydot.Node(node))

for edge in model.edges:
    dot.add_edge(pydot.Edge(edge[0], edge[1]))

# defina o layout do grafo
pos = graphviz_layout(G, prog='dot')

# desenhe o grafo usando o networkx
nx.draw(G, pos, with_labels=True)

# renderize o grafo com o pydot
graph = pydot.graph_from_dot_data(dot.to_string())[0]
graph.write_png('graph_asia2.png')
