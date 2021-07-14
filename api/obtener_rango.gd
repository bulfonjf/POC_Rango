extends Node

func do(centro : Vector2, radio : int) -> Array:
	var gasto_centro = 0
	var step_centro = Step.new(centro, gasto_centro)

	var rango = Rango.new(step_centro, radio)

	var celdas = []
	for step in rango.steps_optimos.steps:
		celdas.append(step.celda)

	return celdas
