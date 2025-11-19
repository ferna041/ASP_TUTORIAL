% Colores disponibles
color(red).
color(green).
color(blue).
% color(yellow).

% cada nodo debe tener exactamente un color
1 { color(N,C) : color(C) } 1 :- node(N).

% nodos adyacentes no pueden tener el mismo color
:- edge(X,Y), color(X,C), color(Y,C).


#show color/2.
