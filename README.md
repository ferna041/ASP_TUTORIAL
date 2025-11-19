# Ejemplos ASP
## Requirements:

- python 3.x
- clingo (pip install clingo) 

## Ejecutar instancias:

- python run_clingo.py ´model.asp´ ´Instance.asp´

### k-coloring
- python run_clingo.py K-coloring\Kcoloring_model.asp K-coloring\Kcoloring_triangle.asp
- python run_clingo.py K-coloring\Kcoloring_model.asp K-coloring\Kcoloring_square.asp
- python run_clingo.py K-coloring\Kcoloring_model.asp K-coloring\Kcoloring_petersen.asp

### N-queens

- python .\run_clingo.py .\N-Queens\NQueens_model.asp .\N-Queens\NQueens_4.asp
- python .\run_clingo.py .\N-Queens\NQueens_model.asp .\N-Queens\NQueens_8.asp

### QBF


- Falta añadir este ejemplo, Quantified Boolean Formula. Es la versión “cuantificada” de SAT: en lugar de solo una fórmula booleana φ(x1,...,xn) sin cuantificadores, una QBF tiene cuantificadores delante por ejemplo ∃x1 ∀y1 ∃x2 φ(x1,x2,y1,...).
