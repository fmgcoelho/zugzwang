from clingo import Control

ctl = Control(["0"])
ctl.add("base", [], "2 { numero(1..6) } 2.")
ctl.add("base", [], "%* 0.01 :: asia. *%")
ctl.add("base", [], "par(2 * X) :- numero(X).")
ctl.ground([("base", [])])
print(ctl.solve(on_model=print))


class LineInfo:
    def __init__(self, statement, probability):
        self.statement = statement
        self.probability = probability
        
[
    LineInfo("asia ; -asia. ", 0.01),
    ...
    LineInfo("bronc ; -bronc :- smoke.", 0.6),
    ...
    
]