extends "res://addons/gut/test.gd"

func test_init_parametro_default():
    # Arrange
    var resultado_esperado = []
    
    # Act
    var resultado_obtenido = StepsOptimos.new()
    
    #Assert
    assert_is(resultado_obtenido, StepsOptimos)
    assert_eq(resultado_obtenido.steps, resultado_esperado)

func test_init():
    # Arrange
    var test_suite = [
        {
            nombre = "pasando array vacio - debe crear una instancia de StepOptimos sin steps",
            steps = [],
            resultado_esperado = [],
        },
    ]
    
    for tc in test_suite:
        # Act
        var resultado_obtenido = StepsOptimos.new(tc.steps)
        
        #Assert
        assert_is(resultado_obtenido, StepsOptimos)
        assert_eq(resultado_obtenido.steps, tc.resultado_esperado)

func test_append_debe_agregar():
	# Arrange
	var test_suite = [
		{
			nombre = "sin steps registrados - debe agregar",
			step = Step.new(Vector2(0,0), 3),
			steps_registrados = []
		},
		{
			nombre = "step no está en los steps registrados - debe agregar",
			step = Step.new(Vector2(0,3), 3),
			steps_registrados = [
				Step.new(Vector2(0,1), 3),
				Step.new(Vector2(0,2), 3)
			],
		},
	]
		
	# Act
	for tc in test_suite:
		var sut = StepsOptimos.new(tc.steps_registrados)
		sut.append(tc.step)

		#Assert
		assert_true(tc.step in sut.steps)

func test_append_no_debe_agregar():
	# Arrange
	var test_suite = [
		{
			nombre = "step ya registrado - no debe agregar",
			step = Step.new(Vector2(0,1), 2),
			steps_registrados = [
				Step.new(Vector2(0,1), 3),
				Step.new(Vector2(0,2), 3)
			],
		},
	]
		
	# Act
	for tc in test_suite:
		var sut = StepsOptimos.new(tc.steps_registrados)
		sut.append(tc.step)

		#Assert
		assert_false(tc.step in sut.steps)

func test_get_step_by_celda_debe_devolver_step_buscado():
	# Arrange
	var celda_1 = Vector2(1,1)
	var step_celda_1 = Step.new(celda_1, 1)
	
	var test_suite = [
		{
			nombre = "StepOptimo con un solo step - debe devolver step buscado",
			celda = celda_1,
			steps_registrados = [step_celda_1],
			resultado_esperado = step_celda_1,
		},
		{
			nombre = "StepOptimo con muchos steps - debe devoler el step buscado",
			celda = celda_1,
			steps_registrados = [
				step_celda_1,
				Step.new(Vector2(2,2), 2),
				Step.new(Vector2(0,1), 1),
				Step.new(Vector2(1,0), 1)
			],
			resultado_esperado = step_celda_1,
		}
	]
	
	for tc in test_suite:
		print(tc.nombre)
		var sut = StepsOptimos.new(tc.steps_registrados)
		
		# Act
		var resultado_obtenido = sut.get_step_by_celda(tc.celda)
		
		# Assert
		assert_eq(resultado_obtenido, tc.resultado_esperado)


func test_get_step_by_celda_debe_devolver_step_nulo():
		# Arrange
		var celda_1 = Vector2(1,1)
		var celda_2 = Vector2(1,0)
		var step_celda_2 = Step.new(celda_2, 1)
		
		var test_suite = [
			{
				nombre = "StepOptimo sin steps - debe devolver step nulo",
				celda = celda_1,
				steps_registrados = [],
			},
			{
				nombre = "StepOptimo con un solo step - debe devolver step nulo",
				celda = celda_1,
				steps_registrados = [step_celda_2],
			},
			{
				nombre = "StepOptimo con muchos steps - debe devoler el step nulo",
				celda = celda_1,
				steps_registrados = [
					step_celda_2,
					Step.new(Vector2(2,2), 2),
					Step.new(Vector2(0,1), 1), 
					Step.new(Vector2(2,0), 1)
				],
			}
		]
		
		for tc in test_suite:
			print(tc.nombre)
			var sut = StepsOptimos.new(tc.steps_registrados)
			
			# Act
			var resultado_obtenido = sut.get_step_by_celda(tc.celda)
			
			# Assert
			assert_true(resultado_obtenido is StepNulo)
	