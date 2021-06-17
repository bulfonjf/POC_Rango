extends Node

const max_int = 10000000

func obtener_rango(centro : Vector2, radio : int) -> Array:
    # numero de pasos del centro
    var numero_paso = 0
    # guardo el centro
    var dic = {
        # key: Vector2, value: int
        centro: numero_paso
    }
    # obtengo celdas adyacentes del centro
    var celdas_adyacentes = obtener_celdas_adyacentes(centro)
    # por cada celda adyacente del centro evaluo el camino
    for celda in celdas_adyacentes:
        numero_paso = 0
        evaluar_camino(celda, numero_paso, dic, radio)
    
    return dic.keys()

func evaluar_camino(celda : Vector2, numero_paso : int, dic : Dictionary, radio: int):
    #evaluar si el numero de paso es menor al radio
    #si la celda {celda:numero_paso} no existe o ya fue anotada en forma menos optima
    #guardarla
    #sumarle uno al paso
    #sacar celdas adyacentes
    #llamarse a si misma por cada celda con el paso incrementado

    if numero_paso <= radio:
        var valor_guardado = dic.get(celda, null)
        var continuar_evaluando = false
        # si no existe la celda, guardala
        if valor_guardado == null:
            dic[celda] = numero_paso
            continuar_evaluando = true
        # si existe pero con un path mas largo, pisalo asi queda el path mas optimo
        elif valor_guardado > numero_paso:
            dic[celda] =  numero_paso
            continuar_evaluando = true
        # si existe la celda y ya tenia un path optimo, no haga nada
        else: 
            continuar_evaluando = false
            pass
        
        if continuar_evaluando:
            numero_paso += 1
            var celdas_adyacentes = obtener_celdas_adyacentes(celda)
            for ca in celdas_adyacentes:
                evaluar_camino(ca, numero_paso, dic, radio)
        else:
            # no seguir evaluando este camino
            pass
    else:
        # me las pico
        pass

func obtener_celdas_adyacentes(celda : Vector2) -> Array:
    var celda_izquierda = celda + Vector2.LEFT
    var celda_derecha = celda + Vector2.RIGHT
    var celda_superior = celda + Vector2.UP
    var celda_inferior = celda + Vector2.DOWN
    
    return [celda_izquierda, celda_derecha, celda_superior, celda_inferior]

# Centro llama "evaluar camino" por cada celda adyacente (4, izq, derecha, arriba, abajo):
# evaluar_camino(): --recursiva que se va a cortar. 

# centro
# pido celdas adyacentes (centro) -array
# asignar un valor a cada celda
# array comparo si ya estan evaluadas optimamente
# guardarlas 
# si el valor es menor al rango:
# repetir
#  1
# 101
#  1
# for celda in celda adyacentes()
# array comparo si ya estan evaluadas no
# pido celdas adyacentes ()