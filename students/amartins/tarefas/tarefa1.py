from pgmpy.readwrite import BIFReader
import networkx as nx
import pydot
from networkx.drawing.nx_pydot import graphviz_layout

def summary_dag(filename):
    file = BIFReader(filename)
    model = file.get_model() # Cria um objeto BayesianModel
    nodes = model.nodes()
    
    asc = 0
    des = 0
    nodes_in = 0
    nodes_out = 0

    for x in nodes:
        # Obtem os nós pais e filhos de cada nós
        parents = model.get_parents(x)
        children = model.get_children(x)
        
        if len(parents) != 0:
            des += 1
        if len(children) != 0:
            asc += 1
        nodes_in += len(children)
        nodes_out += len(parents)
    
    return {'dag_file': filename, 'nodes': nodes, 'count_parents': des, 'count_children': asc, 'count_in_edges': nodes_in, 'count_out_edges': nodes_out}

def summary_str(d):
    s = "DAG file:               " + d["dag_file"] + "\n"
    s += "    Number of nodes:    " + str(len(d["nodes"])) + "\n"
    s += "    Number of parents:  " + str(d["count_parents"]) + "\n"
    s += "    Number of children: " + str(d["count_children"]) + "\n"
    s += "    Average in-degree:  " + str(d["count_in_edges"]/len(d["nodes"])) + "\n"
    s += "    Average out-degree: " + str(d["count_out_edges"]/len(d["nodes"])) + "\n"
    s += "    Nodes:" + "\n"
    nodes = d["nodes"]
    for x in nodes:
        s += "        " + str(x) + "\n"
    return s

def show_dag(model):
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
    
def save_dag(model, target_filename):
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
    # renderize o grafo com o pydot
    graph = pydot.graph_from_dot_data(dot.to_string())[0]
    graph.write_png(target_filename)


summary = summary_dag("asia2.bif")
message = summary_str(summary)
print(message)