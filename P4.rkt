#lang scheme

;; Funcion que busca todas las rutas hacia un producto en una bodega modelada como arbol N-ario.
;; Cada sublista representa un pasillo/estante y los simbolos son productos.
;; Retorna una lista de rutas (listas de indices) desde la entrada hasta cada aparicion del producto buscado.
;;
;; arbol : lista anidada que representa la bodega (el primer elemento es el nombre de la bodega)
;; producto : simbolo que indica el producto a buscar
(define (busqueda-almacen arbol producto)
    ;; Funcion auxiliar recursiva que busca el producto en el contenido actual y acumula la ruta recorrida.
    ;;
    ;; contenido : lista actual a recorrer (puede ser una sublista de la bodega)
    ;; ruta : lista de indices que representa el camino recorrido hasta el punto actual
    (define (buscar contenido ruta)
        ;; Funcion interna que recorre la lista actual guardando las rutas que se encuentran.
        ;;
        ;; cont : lista a recorrer en este nivel
        ;; idx : indice actual (empieza en 1)
        ;; acc : acumulador de rutas encontradas
        (define (iter cont idx acc)
            (if (null? cont)
                acc
                (let ((elem (car cont)))
                    (if (list? elem)
                        ;; Si se ecnuentra una lista, entra a la sublista (car elem)y se pasa (cdr elem)
                        (iter (cdr cont) (+ idx 1)
                               (append acc (buscar (cdr elem) (append ruta (list idx)))))
                        ;; Si se encuentra el producto buscado, se agrega la ruta
                        (if (eq? elem producto)
                            (iter (cdr cont) (+ idx 1)
                                  (append acc (list (append ruta (list idx)))))
                            (iter (cdr cont) (+ idx 1) acc))))))
        ;; Se empueza el recorrido desde el indice 1, porque en el 0 esta 'bodega'
        (iter contenido 1 '()))
    ;; Se ignora 'bodega' y se empieza a buscar el producto en el arbol
    (buscar (cdr arbol) '()))

;; Definicion de la bodega de prueba (arbol N-ario con pasillos, estantes y productos)
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))

;; Pruebas de la funcion con distintos productos
(busqueda-almacen bodega 'pan)
(busqueda-almacen bodega 'queso)
(busqueda-almacen bodega 'fruta)