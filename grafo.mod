# Exemplinho de grafo pequeno e problemas lineares associados, modelados
# para o GLPK.
#
# Rodar com glpsol --math grafo.mod
#
# Autor: Rogério Theodoro de Brito <rbrito@ime.usp.br>
#

# vértices: 1, ..., 6
# vértices especiais: 1 (s), 6 (t)
# arestas: a, b, c, d, e, f
#          
#          3
#    a  b/   \c  f
#  1 -- 2     5 -- 6
#       d\   /e
#          4
#
# O grafo acima é biparticionável: V_1 = {1, 3, 4, 6}, V_2 = {2, 5}
#
#
# Conclusão: pelo Teorema de König, uma cobertura mínima de vértices deve
# ser de mesma cardinalidade do que um emparelhamento de cardinalidade
# máxima.

# Uma variável escolha para cada aresta
var xa;
var xb;
var xc;
var xd;
var xe;
var xf;

maximize obj: xa + xb + xc + xd + xe + xf; # Maximizar o tamanho de um emparelhamento


s.t. c1: xa + xb +      xd           <= 1; # para vértice 2
s.t. c2:      xb + xc                <= 1; # para vértice 3
s.t. c3:                xd + xe      <= 1; # para vértice 4
s.t. c4:           xc +      xe + xf <= 1; # para vértice 5

solve;

display xa, xb, xc, xd, xe, xf;

end;
