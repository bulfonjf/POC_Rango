extends "res://addons/gut/test.gd"

func test_obtener_celdas_adyacentes_devuelve_array_de_Vector2_adyacentes_al_centro():
	#Arrange
	var test_suite = [
		{
			nombre = "desde el vector (0,0), debe devolver 1, -1 y 0 segun el eje",
			centro = Vector2(0,0),
			resultado_esperado = [Vector2(1,0), Vector2(-1,0), Vector2(0,1), Vector2(0,-1)],
		},
		{
			nombre = "desde el vector (-1,2), debe devolver las celdas adyacentes",
			centro = Vector2(-1,2),
			resultado_esperado = [Vector2(-2,2), Vector2(0,2), Vector2(-1,1), Vector2(-1,3)],
		},
	]
	#Act
	for tc in test_suite:
		print(tc.nombre)
		var resultado_obtenido = Grilla.obtener_celdas_adyacentes(tc.centro)
		assert_eq(resultado_obtenido.sort(), tc.resultado_esperado.sort())
