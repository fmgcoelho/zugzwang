from unicodedata import numeric
from sympy import *
from sympy.plotting import plot

def variants(expr, with_plot=False):
    print(f"Expr: {latex(expr)}")
    print(f"Simplify: {latex(simplify(expr))}")
    print(f"Expand: {latex(expand(expr))}")
    print(f"Factor: {latex(factor(expr))}")
    if with_plot:
        plot(expr, (d, 0, 1, 10),ylabel="$\\mathrm{P(expr \\mid \\alpha = 0.3)}$")

init_printing(use_unicode=True)

a, d = symbols('a d')
A = 1 - a
D = 1 - d

wab = a * d
wac = a * D
wA = A

wabc = wab * wac
wAb = wA
wa = wab + wac
wb = wab
wc = wac
wE = wab + wab + wA

z = wabc + 9 * wA + wab + wac  + wa + wb +wc + wE
pabc = wabc/z

z_03 = z.subs(a, 0.3)
wabc_03 = wabc.subs(a, 0.3)
pabc_03 = pabc.subs(a, 0.3)

variants(z_03)
variants(wabc_03)
variants(pabc_03)
print(solve(wabc_03 - 0.0015 * z_03, d))

