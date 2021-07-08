class_name Grilla

static func obtener_celdas_adyacentes(celda : Vector2) -> Array:
	var celda_izquierda = celda + Vector2.LEFT
	var celda_derecha = celda + Vector2.RIGHT
	var celda_superior = celda + Vector2.UP
	var celda_inferior = celda + Vector2.DOWN
	
	return [celda_izquierda, celda_derecha, celda_superior, celda_inferior]