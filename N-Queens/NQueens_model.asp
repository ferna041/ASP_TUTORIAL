% "Generar" tablero
row(1..N) :- n(N).
col(1..N) :- n(N).

% Solo 1 reina por columna y fila
1 { q(R,C) : col(C) } 1 :- row(R).
1 { q(R,C) : row(R) } 1 :- col(C).

% Solo 1 reina por diagonal
:- q(R1,C1), q(R2,C2), R1 < R2, C1 + R1 == C2 + R2.
:- q(R1,C1), q(R2,C2), R1 < R2, C1 - R1 == C2 - R2.


#show q/2.
