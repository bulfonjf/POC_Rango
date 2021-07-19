extends Node

func do(centro : Vector2, radio : int) -> Array:
	var rango = Rango.new(centro, radio)

	var celdas = []
	for step in rango.steps_optimos.steps:
		celdas.append(step.celda)

	return celdas
