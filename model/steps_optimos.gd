class_name StepsOptimos

var steps : Array     

func _init(_steps : Array = []):
	self.steps = []
	for s in _steps:
		if s is Step:
			self.steps.append(s)

func append(_step_to_add : Step):
	var agregar = true
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
