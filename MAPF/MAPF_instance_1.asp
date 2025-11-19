#const bound = 6.

% un solo robot
robot(r1).

% dominio espacial
rangeX(1..3).
rangeY(1..3).

% dominio temporal (T = 1..bound; T=0 lo usamos solo para at/estado inicial)
time(1..bound).

% estado inicial
at(r1,1,1,0).

% meta
goal(r1,3,3).

% sin obstáculos
obstacle(2,2).
obstacle(2,3).

% cost_to_go: distancia Manhattan a la meta (3,3)
cost_to_go(r1,1,1,4).
cost_to_go(r1,1,2,3).
cost_to_go(r1,1,3,2).
cost_to_go(r1,2,1,3).
cost_to_go(r1,2,2,2).
cost_to_go(r1,2,3,1).
cost_to_go(r1,3,1,2).
cost_to_go(r1,3,2,1).
cost_to_go(r1,3,3,0).

% tiempo óptimo (mínimo) de llegada según dijkstra
dijkstra(r1,4).
