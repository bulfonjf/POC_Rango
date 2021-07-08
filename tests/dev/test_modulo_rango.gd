extends "res://addons/gut/test.gd"


func test_obtener_rango_devuelve_tipo_de_dato_rango():
	# Act
	var resultado_obtenido = ModuloRango.obtener_rango(Vector2(0,0), 0)

	# Assert
	assert_is(resultado_obtenido, Rango)

func test_obtener_rango_desde_centro_y_total_recurso_devuelve_un_rango():
	# Arrange
	var centro = Vector2(0,4)
	var total_recurso = 2
	var steps_optimos = StepsOptimos.new([
		Step.new(centro,0), # CENTRO
		Step.new(Vector2(-2,4), 2), Step.new(Vector2(-1,4), 1), Step.new(Vector2(1,4), 1), Step.new(Vector2(2,4), 2), # VARIACION EJE X
		Step.new(Vector2(0,2), 2), Step.new(Vector2(0,3), 1), Step.new(Vector2(0,5), 1), Step.new(Vector2(0,6), 2), # VARIACION EJE Y
		Step.new(Vector2(1,5), 2), Step.new(Vector2(1,3), 1), Step.new(Vector2(-1,3), 1), Step.new(Vector2(-1,5), 2), # VARIACION DE LAS DOS DIAG EN 1 
	])
	var resultado_esperado = Rango.new()
	resultado_esperado.add_steps_optimos(steps_optimos)

	# Act
	var resultado_obtenido = ModuloRango.obtener_rango(centro, total_recurso)
   
	# Assert
	assert_true(resultado_obtenido._eq(resultado_esperado))

