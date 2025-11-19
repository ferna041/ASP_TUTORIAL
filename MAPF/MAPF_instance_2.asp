#const bound = 9.

% robots
robot(r1; r2).

% dominio espacial
rangeX(1..4).
rangeY(1..4).

% dominio temporal
time(1..bound).

% estados iniciales
at(r1,1,1,0).
at(r2,4,1,0).

% metas
goal(r1,4,4).
goal(r2,1,4).

% obstáculos
obstacle(2,2).
obstacle(3,3).
obstacle(2,3).

% cost_to_go usando distancia Manhattan a la meta correspondiente

% --- robot r1, meta (4,4)
cost_to_go(r1,1,1,6).
cost_to_go(r1,1,2,5).
cost_to_go(r1,1,3,4).
cost_to_go(r1,1,4,3).
cost_to_go(r1,2,1,5).
cost_to_go(r1,2,2,4).
cost_to_go(r1,2,3,3).
cost_to_go(r1,2,4,2).
cost_to_go(r1,3,1,4).
cost_to_go(r1,3,2,3).
cost_to_go(r1,3,3,2).
cost_to_go(r1,3,4,1).
cost_to_go(r1,4,1,3).
cost_to_go(r1,4,2,2).
cost_to_go(r1,4,3,1).
cost_to_go(r1,4,4,0).

% --- robot r2, meta (1,4)
cost_to_go(r2,1,1,3).
cost_to_go(r2,1,2,2).
cost_to_go(r2,1,3,1).
cost_to_go(r2,1,4,0).
cost_to_go(r2,2,1,4).
cost_to_go(r2,2,2,3).
cost_to_go(r2,2,3,2).
cost_to_go(r2,2,4,1).
cost_to_go(r2,3,1,5).
cost_to_go(r2,3,2,4).
cost_to_go(r2,3,3,3).
cost_to_go(r2,3,4,2).
cost_to_go(r2,4,1,6).
cost_to_go(r2,4,2,5).
cost_to_go(r2,4,3,4).
cost_to_go(r2,4,4,3).

% tiempos óptimos para cada robot
dijkstra(r1,6).
dijkstra(r2,6).