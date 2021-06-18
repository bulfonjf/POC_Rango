extends "res://addons/gut/test.gd"

func test_constructor_modulo_rango_devuelve_una_instancia_de_modulo_rango():
	# Assert
	assert_true(ModuloRango != null, "ModuloRango no es null")
	assert_true(ModuloRango.get_parent() == get_tree().get_root(), "ModuloRango es hijo directo del root (Singleton)")

func test_obtener_rango_devuelve_tipo_de_dato_array():
	# Act
	var resultado = ModuloRango.obtener_rango(Vector2(0,0), 0)

	# Assert
	assert_true(resultado is Array, "obtener rango devolvio un array")

func test_obtener_rango_desde_centro_y_radio_devuelve_un_conjunto_de_celdas_de_steps_optimos():
	# Arrange
	var centro = Vector2(0,4)
	var radio = 2
	var resultado_esperado = [ Vector2(0,4), # CENTRO
		Vector2(-2,4), Vector2(-1,4), Vector2(1,4), Vector2(2,4), # VARIACION EJE X
		Vector2(0,2), Vector2(0,3), Vector2(0,5), Vector2(0,6), # VARIACION EJE Y
		Vector2(1,5), Vector2(1,3), Vector2(-1,3), Vector2(-1,5), # VARIACION DE LAS DOS DIAG EN 1 
	]

	# Act
	var resultado_obtenido = ModuloRango.obtener_rango(centro, radio)
   
	# Assert
	assert_eq(resultado_obtenido.sort(), resultado_esperado.sort())

func test_obtener_celdas_adyacentes_devuelve_array_de_Vector2_adyacentes_al_centro():
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

	for tc in test_suite:
		print(tc.nombre)
		var resultado_obtenido = ModuloRango.obtener_celdas_adyacentes(tc.centro)
		assert_eq(resultado_obtenido.sort(), tc.resultado_esperado.sort())

func test_si_recursos_disponible_para_realizar_el_step():
	# Arrange
	var test_suite = [
		{
			nombre = "recursos disponibles - debe retornar true",
			total_de_recurso  = 3,
			gasto_de_recurso = 2,
			resultado_esperado = true
		},
		{
			nombre = "recursos no disponibles - debe retornar false",
			total_de_recurso  = 2,
			gasto_de_recurso = 6,
			resultado_esperado = false
		},
	]

	# Act
	for tc in test_suite:
		print(tc.nombre)
		var resultado_obtenido = ModuloRango.si_recursos_disponible_para_realizar_el_step(tc.gasto_de_recurso, tc.total_de_recurso)
		# Assert
		assert_eq(resultado_obtenido, tc.resultado_esperado)

func test_si_step_es_optimo():
	# Arrange
	var test_suite = [
		{
			nombre = "step optimo - debe devolver true",
			step = {"celda": Vector2(0,0), "gasto": 1},
			steps_optimos = StepsOptimos.new([
				Step.new(Vector2(0,0), 2),
				Step.new(Vector2(0,0), 3),
			]),
			resultado_esperado = true,
		},
		{
			nombre = "step no optimo - debe devolver false",
			step = {"celda": Vector2(0,0), "gasto": 7},
			steps_optimos = StepsOptimos.new([
				Step.new(Vector2(0,0), 2),
				Step.new(Vector2(0,0), 3),
			]),
			resultado_esperado = false,
		},
	]
	
	for tc in test_suite:
		print(tc.nombre)
		var resultado_obtenido = ModuloRango.si_step_es_optimo(tc.step, tc.steps_optimos)
		assert_eq(resultado_obtenido, tc.resultado_esperado)

