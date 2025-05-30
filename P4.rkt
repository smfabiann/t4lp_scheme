#lang scheme

;; Busca las rutas para encontrar un producto 'producto' en un arbol N-ario (lista compuesta) 'arbol'.
;; Retorna las rutas en forma de listas reprecentado los indices de la lista compuesta
;;
;; arbol : lista compuesta reprecentando el arbol N-ario
;; producto : elemento a buscar en el arbol
(define (busqueda-almacen arbol producto)
    ;; Misma funcionalidad que 'bisqueda-almacen' pero con la capasidad de guardar el recorrido, asi
    ;; poder usar recursividad mientras se guarda el recorrido de la busqueda.
    ;;
    ;; arbol : lista compuesta reprecentando el arbol N-ario
    ;; producto : elemento a buscar en el arbol
    ;; recorrido : lista que guarda el recorrido de la busqueda
    (define (auxiliar ls producto recorrido)
        (if (null? ls)   ;; iteramos
            '()
            (let ((i (+ 1 (length recorrido))))   ;; creamos la variable i
                (if (list? (car ls))
                    ;; si es una lista, seguimos buscando
                    (append
                        (auxiliar (car ls) producto (append recorrido (list i)))  
                        (auxiliar (cdr ls) producto recorrido)  ;; continuamos con el resto de la lista
                    )
                    ;; sino, vemos si encontramos el producto
                    (if (eq? (car ls) producto)  
                        ;; si encontramos el producto
                        (cons (append recorrido (list i))  ;; guardamos el recorrido
                                (auxiliar (cdr ls) producto recorrido))  ;; continuamos con el resto de la lista
                        ;; si no es el producto
                        (auxiliar (cdr ls) producto recorrido)  ;; seguimos buscando
                    )
                )
            )  ;; 
        )
    )
    ;; partimos saltando el primer elemento "bodega"
    (auxiliar (cdr arbol) producto '())
)


(define bodega
'(bodega
(pasillo1 leche pan)
(pasillo2 (estanteA pan queso) (estanteB manzana pan))
(pasillo3 fruta)))

;; 1. Buscar “pan”
(busqueda-almacen bodega 'pan)
;; 2. Buscar “queso”
(busqueda-almacen bodega 'queso)
;; 3. Buscar “fruta”
(busqueda-almacen bodega 'fruta)
