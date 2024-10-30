#!env python
import pickle
from pgmpy.readwrite import BIFReader
import networkx as nx
import pydot
from networkx.drawing.nx_pydot import graphviz_layout
from bninput import *

def get_yes_probabilities(model):
    nodes = model.nodes()

    yes_probabilities = {}

    for node in nodes:
        cpd = model.get_cpds(node)
        state_names = cpd.state_names[node]
        yes_index = state_names.index("yes")
        yes_prob = cpd.values[yes_index]
        yes_probabilities[node] = yes_prob

    return yes_probabilities

def compile_bn2asp(model):
    """_summary_

    Args:
        model (_type_): _description_

    Returns:
        _type_: _description_
    """
    probabilities = get_yes_probabilities(model)
    sf = ""
    for node, yes_prob in probabilities.items():
        parents = model.get_parents(node)
        s = ""
        if len(parents) == 0:
            s += f"%* {yes_prob} :: {node}. *% \n"
            s += f"{node} ; -{node}. \n\n"
            sf += s
        elif len(parents) == 1:
            p = parents[0]
            s += f"%* {yes_prob[0]} :: {node} :- {p}. *% \n"
            s += f"{node} ; -{node} :- {p}. \n"
            s += f"%* {yes_prob[1]} :: {node} :- -{p}. *% \n"
            s += f"{node} ; -{node} :- -{p}. \n\n"
            sf += s
        else:
            yes1 = yes_prob[0]
            yes2 = yes_prob[1]
            p0 = parents[0]
            p1 = parents[1]
            s += f"%* {yes1[0]} :: {node} :- {p0}, {p1}. *% \n"
            s += f"{node} ; -{node} :- {p0}, {p1}. \n"
            s += f"%* {yes2[0]} :: {node} :- -{p0}, {p1}. *% \n"
            s += f"{node} ; -{node} :- -{p0}, {p1}. \n"
            s += f"%* {yes1[1]} :: {node} :- {p0}, -{p1}. *% \n"
            s += f"{node} ; -{node} :- {p0}, -{p1}. \n"
            s += f"%* {yes2[1]} :: {node} :- -{p0}, -{p1}. *% \n"
            s += f"{node} ; -{node} :- -{p0}, -{p1}. \n"
            
            sf += s
    return sf

if __name__ == "__main__":
    # summary = summary_dag("/home/fc/sci/projetos/zugzwang/students/amartins/tarefas/asia2.bif")
    summary = pickle.load(open("asia2.pkl", "rb"))
    # 3.2776401042938232
    
    model = summary["bnmodel"]
    # 1.1920928955078125e-06
    
    sum = compile_bn2asp(model)
    # 0.00010275840759277344
    
    print(sum)
    # 5.269050598144531e-05
    
    # TOTAL DE TEMPO: 5.778 SEGUNDOS
