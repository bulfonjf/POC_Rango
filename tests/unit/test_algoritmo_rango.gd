extends "res://addons/gut/test.gd"

func test_constructor_modulo_rango_devuelve_una_instancia_de_modulo_rango():
	# Assert
	assert_true(ModuloRango != null, "ModuloRango no es null")
	assert_true(ModuloRango.get_parent() == get_tree().get_root(), "ModuloRango es hijo directo del root (Singleton)")

func test_obtener_rango_devuelve_un_array():
	# Act
	var resultado = ModuloRango.obtener_rango(Vector2(0,0), 0)

	# Assert
	assert_true(resultado is Array, "obtener rango devolvio un array")

func test_obtener_rango_desde_centro_y_radio_devuelve_Array_de_Vector2():
	# Arrange
	var centro = Vector2(0,4)
	var radio = 2
	var resultadoEsperado = [ Vector2(0,4), # CENTRO
		Vector2(-2,4), Vector2(-1,4), Vector2(1,4), Vector2(2,4), # VARIACION EJE X
		Vector2(0,2), Vector2(0,3), Vector2(0,5), Vector2(0,6), # VARIACION EJE Y
		Vector2(1,5), Vector2(1,3), Vector2(-1,3), Vector2(-1,5), # VARIACION DE LAS DOS DIAG EN 1 
	]

	# Act
	var resultadoObtenido = ModuloRango.obtener_rango(centro, radio)
   
	# Assert
	assert_eq(resultadoEsperado.sort(), resultadoObtenido.sort())
