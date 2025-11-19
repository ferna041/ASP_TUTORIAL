% Colores disponibles
color(red).
color(green).
color(blue).
% color(yellow).

% cada nodo debe tener exactamente un color
1 { color_of(N,C) : color(C) } 1 :- node(N).

% nodos adyacentes no pueden tener el mismo color
:- edge(X,Y), color_of(X,C), color_of(Y,C).


#show color_of/2.
