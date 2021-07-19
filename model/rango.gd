class_name Rango

var steps_optimos : StepsOptimos

func _init(centro : Vector2, radio : int):
	var steps_optimos = StepsOptimos.new(centro)
	set_steps_optimos(steps_optimos)
	# obtengo celdas adyacentes del centro
	var celdas_adyacentes_al_centro = Grilla.obtener_celdas_adyacentes(centro)
	var gasto = 0
	# por cada celda adyacente del centro evaluo el camino
	for celda in celdas_adyacentes_al_centro:
		steps_optimos.obtener_steps_optimos(celda, gasto, self.steps_optimos, radio)
		self.set_steps_optimos(steps_optimos)
	
	pass
		
func set_steps_optimos(_steps_optimos : StepsOptimos):
	steps_optimos = _steps_optimos

