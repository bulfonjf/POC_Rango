class_name StepsOptimos

var steps : Array     
var origen : Step

func _init(_origen : Vector2):
	var gasto_centro = 0
	self.origen = Step.new(_origen, gasto_centro) #TO-DO revisar si devuelve un StepNulo y devolver error en ese caso
	self.append(self.origen)

func append(_step_to_add : Step):
	var agregar = not _step_to_add is StepNulo
	for step in self.steps:
		if step.celda == _step_to_add.celda:
			agregar = false
			break

	if agregar:
		self.steps.append(_step_to_add)

func get_step_by_celda(celda : Vector2) -> Step:
	for step in self.steps:
		if step.celda == celda:
			return step
	return StepNulo.new()

func _eq(_steps_optimos : StepsOptimos) -> bool:
	var steps_iguales = true
	if len(self.steps) == len(_steps_optimos.steps) :
		for step in _steps_optimos.steps:
			for step_propio in self.steps:
				if step.celda == step_propio.celda and step.gasto == step_propio.gasto:
					steps_iguales = true
				else:
					steps_iguales = false
	else:
		steps_iguales = false
	return steps_iguales

func change_step(step_a_cambiar : Step, step_nuevo : Step): #TO-DO si la funcion es publica no puede ser tan insegura
	var index = self.steps.find(step_a_cambiar) 
	if index != -1:
		self.steps[index] = step_nuevo

func si_step_es_optimo(step : Dictionary) -> bool:
	var step_registrado = self.get_step_by_celda(step.celda)
	return step_registrado is StepNulo || step.gasto < step_registrado.gasto

func obtener_steps_optimos(celda : Vector2, gasto : int, steps_ya_registrados : StepsOptimos, radio: int):
	#evaluar si el gasto es menor al radio => si_recursos_disponible_para_realizar_el_step(gasto, radio)
	#si la celda {celda:gasto} no existe o ya fue anotada en forma menos optima
	#guardarla
	#sumarle uno al paso
	#sacar celdas adyacentes
	#llamarse a si misma por cada celda con el paso incrementado

	if self.si_recursos_disponible_para_realizar_el_step(gasto, radio):
		var step_registrado = steps_ya_registrados.get_step_by_celda(celda)
		var continuar_evaluando = false
		# si no existe la celda, guardala
		# o si existe pero con un path mas largo, pisalo asi queda el path mas optimo
		var step_nuevo = Step.new(celda, gasto) #TO-DO esta linea solo sirve para el if y el elif, no aplica para el else, refactorizar
		if step_registrado == StepNulo:
			steps_ya_registrados.steps.append(step_nuevo) #TO-DO llamar a la funcion append o add
			continuar_evaluando = true
		elif step_registrado.gasto > gasto:
			steps_ya_registrados.change_step(step_registrado, step_nuevo)
			continuar_evaluando = true
		# si existe la celda y ya tenia un path optimo, no haga nada
		else: 
			continuar_evaluando = false
			pass
		
		if continuar_evaluando:
			gasto += 1
			var celdas_adyacentes = Grilla.obtener_celdas_adyacentes(celda)
			for ca in celdas_adyacentes:
				obtener_steps_optimos(ca, gasto, steps_ya_registrados, radio)
		else:
			# no seguir evaluando este camino
			pass
	else:
		# me las pico
		pass
	
func si_recursos_disponible_para_realizar_el_step(gasto_de_recurso : int, total_de_recurso : int) -> bool:
	return gasto_de_recurso <= total_de_recurso
