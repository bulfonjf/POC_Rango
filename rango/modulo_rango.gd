extends Node

func obtener_rango(centro : Vector2, radio : int) -> Rango:
	# numero de pasos del centro
	var gasto = 0
	# guardo el centro
	var dic = {
		# key: Vector2, value: int
		centro: gasto
	}
	# obtengo celdas adyacentes del centro
	var celdas_adyacentes = Grilla.obtener_celdas_adyacentes(centro)
	# por cada celda adyacente del centro evaluo el camino
	for celda in celdas_adyacentes:
		gasto = 0
		evaluar_camino(celda, gasto, dic, radio)
	
	return Rango.new()

func evaluar_camino(celda : Vector2, gasto : int, dic : Dictionary, radio: int):
	#evaluar si el gasto es menor al radio => si_recursos_disponible_para_realizar_el_step(gasto, radio)
	#si la celda {celda:gasto} no existe o ya fue anotada en forma menos optima
	#guardarla
	#sumarle uno al paso
	#sacar celdas adyacentes
	#llamarse a si misma por cada celda con el paso incrementado

	if si_recursos_disponible_para_realizar_el_step(gasto, radio):
		var valor_guardado = dic.get(celda, null)
		var continuar_evaluando = false
		# si no existe la celda, guardala
		# o si existe pero con un path mas largo, pisalo asi queda el path mas optimo
		if valor_guardado == null || valor_guardado > gasto:
			dic[celda] = gasto
			continuar_evaluando = true
		# si existe la celda y ya tenia un path optimo, no haga nada
		else: 
			continuar_evaluando = false
			pass
		
		if continuar_evaluando:
			gasto += 1
			var celdas_adyacentes = Grilla.obtener_celdas_adyacentes(celda)
			for ca in celdas_adyacentes:
				evaluar_camino(ca, gasto, dic, radio)
		else:
			# no seguir evaluando este camino
			pass
	else:
		# me las pico
		pass

func si_recursos_disponible_para_realizar_el_step(gasto_de_recurso : int, total_de_recurso : int) -> bool:
	return gasto_de_recurso <= total_de_recurso





