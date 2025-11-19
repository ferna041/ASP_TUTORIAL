% instance.asp
% Instancia del problema: datos específicos del grafo
% Grafo de tipo "Petersen graph simplificado" con 10 nodos

% Pentágono exterior
node(a). node(b). node(c). node(d). node(e).

% Pentágono interior
node(f). node(g). node(h). node(i). node(j).

% Aristas del pentágono exterior (ciclo)
edge(a,b). edge(b,c). edge(c,d). edge(d,e). edge(e,a).

% Aristas del pentágono interior (estrella)
edge(f,h). edge(h,j). edge(j,g). edge(g,i). edge(i,f).

% Conexiones entre pentágonos (radiales)
edge(a,f). edge(b,g). edge(c,h). edge(d,i). edge(e,j).
