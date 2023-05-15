# SistemasDinamicos
### Modelo
### Ingreso de Datos:
- Debemos poder ingresar el tamaño de la población:
- Población Total siempre mayor a los enfermos
- Enfermos

### Caracteristicas de la Poblacion:
• - Sanos: Pueden ser contagiados por los enfermos
- Enfermos: Pueden contagiar y se pueden curar de la enfermedad que tienen(al curarse queda totalmente inmune)
- Inmunes: Probabilidad de contagio nula
- Muertos: literalmente

### Metodo de Elaboracion(Características del Sistema):
- Se manejan 2 matrices que harán lo siguiente
- La primera matriz será la base con la que evaluaremos para crear la segunda matriz
- La segunda matriz será calculada a partir de la primera generando el siguiente ciclo
- Método de Evaluación: Se recorre la primera matriz evaluando los individuos según el tipo de la siguiente manera:

Nota: Cabe resaltar que el proceso siguiente sigue el orden de los puntos que se dan:

### Enfermo:
- 10% probabilidad de muerte
- 15% probabilidad de Sanar
- Dado que se sano la probabilidad de quedar inmune es del 5%
- Cada ciclo aumenta la probabilidad de muerte un 2%
- Cada ciclo aumenta la probabilidad de sanar en un 1%
- Este caso se hará con una 3ra matriz que guardara las probabilidades cambiadas de los enfermos
	
### Asintomático:
- 3% probabilidad de muerte
- 15% probabilidad de Sanar(queda inmune)
- Cada ciclo aumenta la probabilidad de sanar en un 2%
- Este caso se hará con una 3ra matriz que guardara las probabilidades cambiadas de los enfermos

### Sano:
- 3% probabilidad de muerte
- Revisamos las posiciones arriba, abajo, derecha e izquierda para evaluar la probabilidad de contagio según la cantidad de enfermos
- 10% - 25% de probabilidad de contagio para enfermos (Acumulable según la cantidad de enfermos)
- 25% de probabilidad de contagio para los asintomáticos(Acumulable con la cantidad anterior)

### Inmune:
- 3% probabilidad de muerte
- Probabilidad de contagio del 0%



