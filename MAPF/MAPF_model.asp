% robot(r): express that r is an agent in R,
% rangeX(x): expresses that x is within the legal range for the X axis
% rangeY(y): expresses that y is within the legal range for the Y axis
% time(t): t is a time instant,
% action(a): a is an action,
% obstacle(x,y): specifies that cell (x,y) is an obstacle,
% goal(r,x,y): specifies that the goal cell for agent r is (x,y).
% cost_to_go(r,x,y,c): specifies that the shortest path between (x,y) and r’s goal is c
% delta(a,x,y,x’,y’): specifies that the cell (x’,y’) is reached when performing action a at cell (x,y).
% shift(x,y,a,t): specifies that the cell (x,y) produce the action a to any agent on it at time t.
% at_goal(r,t): specifies that agent r is at the goal at time t.
% penalty(r,t,1): specifies the slack between the makespan T and the time instant at which an agent has stopped at the goal.

% dynamics of the at predicate
at(R,X,Y,T) :- shift(Xp,Yp,A,T-1),at(R,Xp,Yp,T-1),delta(A,Xp,Yp,X,Y), cost_to_go(R,X,Y,C), T + C <= bound.

% the 5 possible actions
action(up; down; left; right; wait).

% a specification of the moves
free(X,Y) :- rangeX(X), rangeY(Y), not obstacle(X,Y).
delta(right,X,Y,X+1,Y) :- rangeX(X), rangeX(X+1), rangeY(Y), free(X,Y).
delta(left,X,Y,X-1,Y) :- rangeX(X), rangeX(X-1), rangeY(Y), free(X,Y).
delta(up,X,Y,X,Y+1) :- rangeX(X), rangeY(Y), rangeY(Y+1), free(X,Y).
delta(down,X,Y,X,Y-1) :- rangeX(X), rangeY(Y), rangeY(Y-1), free(X,Y).
delta(wait,X,Y,X,Y) :- rangeX(X), rangeY(Y), free(X,Y).

% A single action per agent can be performed at each time instant.
1 {shift(X,Y,A,T-1) : action(A)} 1 :- free(X,Y), time(T).
:- at(R,X,Y,T),obstacle(X,Y).

% Vertex conflicts
:- #count{R : at(R,X,Y,T)} > 1, free(X,Y), time(T).

% Swap conflicts
:- shift(X,Y,right,T),shift(X+1,Y,left,T).
:- shift(X,Y,up,T),shift(X,Y+1,down,T).

% Goal achievement
at_goal(R,T) :- at(R,X,Y,T), goal(R,X,Y).
:- robot(R), not at_goal(R,bound).
at_goal_back(R,bound) :- robot(R).
at_goal_back(R,T-1) :- at_goal_back(R,T),at_goal(R,T-1).

% Cost of the optimal path.
penalty(R,T,1) :- time(T), dijkstra(R,Tp), T>Tp, at_goal_back(R,T-1).

% Optimization statement.
#maximize {P,R,T : penalty(R,T,P)}.

#show at/4.