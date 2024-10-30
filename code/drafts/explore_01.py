from clingo.control import Control
from clingox.program import Program, ProgramObserver, Remapping

prg = Program()
ctl_a = Control()
ctl_a.register_observer(ProgramObserver(prg))
print(f"<1>\n{prg}\n</1>")

prog = "code/asp/alarm.lp"     
ctl_a.load(prog)
ctl_a.ground([('base', [])])
print(f"<2>\n{prg}\n</2>")

