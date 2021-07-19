# TODO

- el gasto de la celda esta hardcodeado
	- ver api/obtener_rango.gd
	- ver model/rango.gd
- StepOptimo tiene una precondicion en el init, no tendria que manejar el caso de error, sino devolver el error al cliente (por ahora solo lo consume Rango)
	- Devolver un StepOptimoNulo o un objeto indicando el error
- En obtener_step_optimo estamos llamando a la funcion si_recurso_disponible (algo asi) y se pasa radio como si fuera un total de recurso cuando no lo es.
	- Hay dos limites, uno es el radio y el otro es el recurso
	- la funcion deberia verificar el gasto contra los dos tipos de limite
