# Intro

Algortimo que devuelve un rango de Celdas a partir de un centro, radio, grilla, y handlers (funciones proveidas para aplicar logica externa, ej: filtros, calculo de coste, objetos en la celda, etc)

# Conceptos Intrinsecos del modulo de rango

## Rango
- Rango: Es el conjunto de celdas de los steps mas optimos (o los steps que gastaron menos recurso para llegar a esa celda)

## Grilla
- Grilla: Indica como se distribuyen las celdas.

## Celdas

- Celda: Vector de coordenadas 2D

- Centro: Celda origen en la cual se inicia el algoritmo de rango, es el origen de todos los caminos

## Recursos

- Recurso: Elemento indefinido que se va gastando al moverse de step a step

- Gasto de recurso: El gasto de recurso que se realiza para moverse del centro a la celda del step

- Total de recurso: Cantidad de recurso disponible para gastar

## Steps

- Step: Es el gasto de recursos para ir del centro a una celda. Contiene la celda destino y el gasto de recurso. {"celda": Vector2, "gasto": int}

- Step Optimo: Es el step con el menor gasto de recurso para llegar a una celda

- Diccionario de Steps Optimos: usada para checkear si el step que se esta evaluando es mas optimo o eficiente que los conocidos o ya evaluados.

## Caminos

- Camino: Secuencia de steps desde el centro hasta agotar la totalidad del recurso

- Camino Optimo: es el camino con el menor gasto de recurso para llegar a una celda (incluye que pase por esa celda)


- Limite: (TODO check this) Cantidad maxima de steps que puede tener un camino