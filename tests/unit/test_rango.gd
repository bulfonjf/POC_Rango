extends "res://addons/gut/test.gd"

func test_init():
	#Arrange
	 
	#Act 
	var resultado_obtenido = Rango.new()
	#Assert
	assert_is(resultado_obtenido, Rango)

func test_add_steps_optimos():
    #Arrange
    var sut = Rango.new()
    var steps_optimos = StepsOptimos.new([
		Step.new(Vector2(0,4), 0), 
		Step.new(Vector2(-1,4), 1),
        Step.new(Vector2(1,4), 1)
	])
    var steps_esperados = StepsOptimos.new([
		Step.new(Vector2(0,4), 0), 
		Step.new(Vector2(-1,4), 1),
        Step.new(Vector2(1,4), 1)
	])
    
    #Act
    var resultado_esperado = steps_esperados
    var resultado_obtenido = Rango.add_steps_optimos(steps_optimos)

    #Assert
    assert_