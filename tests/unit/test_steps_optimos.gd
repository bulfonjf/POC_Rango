extends "res://addons/gut/test.gd"

# func test_init_parametro_default():
# 	# Arrange
# 	var resultado_esperado = []
	
# 	# Act
# 	var resultado_obtenido = StepsOptimos.new()
	
# 	#Assert
# 	assert_is(resultado_obtenido, StepsOptimos)
# 	assert_eq(resultado_obtenido.steps, resultado_esperado)

# func test_init():
# 	# Arrange
# 	var test_suite = [
# 		{
# 			nombre = "pasando array vacio - debe crear una instancia de StepOptimos sin steps",
# 			steps = [],
# 			resultado_esperado = [],
# 		},
# 	]
	
# 	for tc in test_suite:
# 		# Act
# 		var resultado_obtenido = StepsOptimos.new(tc.steps)
		
# 		#Assert
# 		assert_is(resultado_obtenido, StepsOptimos)
# 		assert_eq(resultado_obtenido.steps, tc.resultado_esperado)

# func test_append_debe_agregar():
# 	# Arrange
# 	var test_suite = [
# 		{
# 			nombre = "sin steps registrados - debe agregar",
# 			step = Step.new(Vector2(0,0), 3),
# 			steps_registrados = []
# 		},
# 		{
# 			nombre = "step no está en los steps registrados - debe agregar",
# 			step = Step.new(Vector2(0,3), 3),
# 			steps_registrados = [
# 				Step.new(Vector2(0,1), 3),
# 				Step.new(Vector2(0,2), 3)
# 			],
# 		},
# 	]
		
# 	# Act
# 	for tc in test_suite:
# 		var sut = StepsOptimos.new(tc.steps_registrados)
# 		sut.append(tc.step)

# 		#Assert
# 		assert_true(tc.step in sut.steps)

# func test_append_no_debe_agregar():
# 	# Arrange
# 	var test_suite = [
# 		{
# 			nombre = "step ya registrado - no debe agregar",
# 			step = Step.new(Vector2(0,1), 2),
# 			steps_registrados = [
# 				Step.new(Vector2(0,1), 3),
# 				Step.new(Vector2(0,2), 3)
# 			],
# 		},
# 	]
		
# 	# Act
# 	for tc in test_suite:
# 		var sut = StepsOptimos.new(tc.steps_registrados)
# 		sut.append(tc.step)

# 		#Assert
# 		assert_false(tc.step in sut.steps)

# func test_get_step_by_celda_debe_devolver_step_buscado():
# 	# Arrange
# 	var celda_1 = Vector2(1,1)
# 	var step_celda_1 = Step.new(celda_1, 1)
	
# 	var test_suite = [
# 		{
# 			nombre = "StepOptimo con un solo step - debe devolver step buscado",
# 			celda = celda_1,
# 			steps_registrados = [step_celda_1],
# 			resultado_esperado = step_celda_1,
# 		},
# 		{
# 			nombre = "StepOptimo con muchos steps - debe devoler el step buscado",
# 			celda = celda_1,
# 			steps_registrados = [
# 				step_celda_1,
# 				Step.new(Vector2(2,2), 2),
# 				Step.new(Vector2(0,1), 1),
# 				Step.new(Vector2(1,0), 1)
# 			],
# 			resultado_esperado = step_celda_1,
# 		}
# 	]
	
# 	for tc in test_suite:
# 		print(tc.nombre)
# 		var sut = StepsOptimos.new(tc.steps_registrados)
		
# 		# Act
# 		var resultado_obtenido = sut.get_step_by_celda(tc.celda)
		
# 		# Assert
# 		assert_eq(resultado_obtenido, tc.resultado_esperado)


# func test_get_step_by_celda_debe_devolver_step_nulo():
# 		# Arrange
# 		var celda_1 = Vector2(1,1)
# 		var celda_2 = Vector2(1,0)
# 		var step_celda_2 = Step.new(celda_2, 1)
		
# 		var test_suite = [
# 			{
# 				nombre = "StepOptimo sin steps - debe devolver step nulo",
# 				celda = celda_1,
# 				steps_registrados = [],
# 			},
# 			{
# 				nombre = "StepOptimo con un solo step - debe devolver step nulo",
# 				celda = celda_1,
# 				steps_registrados = [step_celda_2],
# 			},
# 			{
# 				nombre = "StepOptimo con muchos steps - debe devoler el step nulo",
# 				celda = celda_1,
# 				steps_registrados = [
# 					step_celda_2,
# 					Step.new(Vector2(2,2), 2),
# 					Step.new(Vector2(0,1), 1), 
# 					Step.new(Vector2(2,0), 1)
# 				],
# 			}
# 		]
		
# 		for tc in test_suite:
# 			print(tc.nombre)
# 			var sut = StepsOptimos.new(tc.steps_registrados)
			
# 			# Act
# 			var resultado_obtenido = sut.get_step_by_celda(tc.celda)
			
# 			# Assert
# 			assert_true(resultado_obtenido is StepNulo)

# func test_eq_debe_devolver_true():
# 	#Arrange
# 	var steps_optimos_vacio = StepsOptimos.new([])
# 	var steps_optimos_un_step = StepsOptimos.new([Step.new(Vector2(2,2), 2)])
# 	var steps_optimos_varios_steps = StepsOptimos.new([Step.new(Vector2(2,2), 2), Step.new(Vector2(2,1), 2)])

# 	var test_suite = [
# 		{
# 			nombre = "Steps optimos vacios",
# 			steps_optimos_1 = steps_optimos_vacio,
# 			steps_optimos_2 = steps_optimos_vacio,
# 		},
# 		{
# 			nombre = "Steps optimos con un solo step",
# 			steps_optimos_1 = steps_optimos_un_step,
# 			steps_optimos_2 = steps_optimos_un_step,
		
# 		},
# 		{
# 			nombre = "Steps optimos con varios steps",
# 			steps_optimos_1 = steps_optimos_varios_steps,
# 			steps_optimos_2 = steps_optimos_varios_steps,
		
# 		},
# 	]

# 	#Act
# 	for tc in test_suite:
# 		var resultado = tc.steps_optimos_1._eq(tc.steps_optimos_2)
# 		#Assert
# 		assert_true(resultado)

# func test_eq_debe_devolver_false():

# 	#Arrange
# 	var celda_a = Vector2(2,2)
# 	var celda_b = Vector2(2,1)
# 	var steps_vacio = StepsOptimos.new([])
# 	var un_step_celda_a = StepsOptimos.new([Step.new(celda_a, 2)])
# 	var un_step_celda_b = StepsOptimos.new([Step.new(celda_b, 2)])
# 	var varios_steps_a = StepsOptimos.new([Step.new(celda_a, 2), Step.new(celda_b, 2)])
# 	var varios_steps_b = StepsOptimos.new([Step.new(celda_a, 2), Step.new(Vector2(2,3), 2)])
	
# 	var test_suite = [
# 		{
# 			nombre = "uno vacio y uno con un solo step",
# 			steps_optimos_1 = steps_vacio,
# 			steps_optimos_2 = un_step_celda_a,
# 		},
# 		{
# 			nombre = "ambos con un solo step distinto",
# 			steps_optimos_1 = un_step_celda_a,
# 			steps_optimos_2 = un_step_celda_b,
# 		},
# 		{
# 			nombre = "Steps optimos con varios steps distintos",
# 			steps_optimos_1 = varios_steps_a,
# 			steps_optimos_2 = varios_steps_b,
# 		},
# 		{
# 			nombre = "steps con indentica celda pero distintos gastos de recursos",
# 			steps_optimos_1 = StepsOptimos.new([Step.new(celda_a, 3)]),
# 			steps_optimos_2 = StepsOptimos.new([Step.new(celda_a, 2)]),
# 		},
# 	]

# 	#Act
# 	for tc in test_suite:
# 		var resultado = tc.steps_optimos_1._eq(tc.steps_optimos_2)
# 		#Assert
# 		assert_false(resultado)

# func test_si_step_es_optimo():
# 	# Arrange

# 	var test_suite = [
# 		{
# 			nombre = "step optimo - debe devolver true",
# 			step = {"celda": Vector2(0,0), "gasto": 1},
# 			steps_optimos = [
# 				Step.new(Vector2(0,0), 2),
# 				Step.new(Vector2(0,0), 3),
# 			],
# 			resultado_esperado = true,
# 		},
# 		{
# 			nombre = "step no optimo - debe devolver false",
# 			step = {"celda": Vector2(0,0), "gasto": 7},
# 			steps_optimos = [
# 				Step.new(Vector2(0,0), 2),
# 				Step.new(Vector2(0,0), 3),
# 			],
# 			resultado_esperado = false,
# 		},
# 	]
	
# 	for tc in test_suite:
# 		print(tc.nombre)
# 		var sut = StepsOptimos.new(tc.steps_optimos)
# 		var resultado_obtenido = sut.si_step_es_optimo(tc.step)
# 		assert_eq(resultado_obtenido, tc.resultado_esperado)

