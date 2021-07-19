extends "res://addons/gut/test.gd"

func test_obtener_rango_desde_centro_y_total_recurso_devuelve_un_array_de_vectores2():
	# Arrange
	var centro = Vector2(0,4)
	var total_recurso = 2
	var resultado_esperado = [
		centro,
		Vector2(-2,4), Vector2(-1,4), Vector2(1,4), Vector2(2,4), # VARIACION EJE X
		Vector2(0,2), Vector2(0,3), Vector2(0,5), Vector2(0,6), # VARIACION EJE Y
		Vector2(1,5), Vector2(1,3), Vector2(-1,3), Vector2(-1,5), # VARIACION DE LAS DOS DIAG EN 1 
	]

	# Act
	var resultado_obtenido = ObtenerRango.do(centro, total_recurso)
   
	# Assert
	assert_eq(resultado_obtenido.sort(), resultado_esperado.sort())

