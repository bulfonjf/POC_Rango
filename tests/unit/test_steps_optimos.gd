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
