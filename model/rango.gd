class_name Rango

var steps_optimos : StepsOptimos

func _init(centro : Step, radio : int):
	# obtengo celdas adyacentes del centro
	var celdas_adyacentes_al_centro = Grilla.obtener_celdas_adyacentes(centro.celda)
	var steps_optimos_para_construir_rango = StepsOptimos.new([centro])
	var gasto = 0
	var dic = {
		# key: Vector2, value: int
		centro: gasto
	}
	# por cada celda adyacente del centro evaluo el camino
	for celda in celdas_adyacentes_al_centro:
		steps_optimos_para_construir_rango.obtener_steps_optimos(celda, gasto, dic, radio)
	
	self.steps_optimos = steps_optimos_para_construir_rango
	pass
		
func add_steps_optimos(_steps_optimos : StepsOptimos):
	steps_optimos = _steps_optimos

func _eq(_rango : Rango) -> bool:
	return true
