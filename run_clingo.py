from clingo import Control
import sys

def main():
    # Verificar argumentos
    if len(sys.argv) < 3:
        print("Uso: python run_clingo.py <archivo_modelo> <archivo_instancia>")
        print("Ejemplo: python run_clingo.py model.asp instance.asp")
        sys.exit(1)
    
    model_file = sys.argv[1]
    instance_file = sys.argv[2]
    
    ctl = Control(["0"]) 
    
    # Carga el modelo (reglas/restricciones)
    try:
        ctl.load(model_file)
    except Exception as e:
        print(f"Error al cargar el modelo '{model_file}': {e}")
        sys.exit(1)
    
    # Carga la instancia
    try:
        ctl.load(instance_file)
    except Exception as e:
        print(f"Error al cargar la instancia '{instance_file}': {e}")
        sys.exit(1)
    
    # Ground el programa base
    ctl.ground([("base", [])])

    # solver
    print(f"Modelo: {model_file}")
    print(f"Instancia: {instance_file}\n")
    print("Buscando todas las soluciones...\n")
    solution_count = 0
    with ctl.solve(yield_ = True) as handle:
        for m in handle:
            solution_count += 1
            atoms = m.symbols(shown=True)
            print(f"Solución {solution_count}:")
            for a in atoms:
                print(f"  {a}")
            print()
    
    print(f"Total de soluciones encontradas: {solution_count}")

if __name__ == "__main__":
    main()
