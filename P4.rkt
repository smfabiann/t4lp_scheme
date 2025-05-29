#lang scheme

(define (busqueda-rama rama producto n)
    (if (null? rama)
        '()
        ()
    )
)

(define (busqueda-almacen arbol producto)
    ;; auxiliar para poder guardado las iteraciones del loop
    (define (auxiliar arbol producto n)
        (if (null? arbol)
            '()
            (cons
                (auxiliar (cdr arbol) producto n)   ;; fin de recursion "'()"
                (busqueda-rama (car arbol) producto (+ n 1))    ;; buscamos el producto dentro de la rama
            )
        )
    )
    ;; partimos de la operacion 0
    (auxiliar arbol producto 0)
)


(define bodega
'(bodega
(pasillo1 leche pan)
(pasillo2 (estanteA pan queso) (estanteB manzana pan))
(pasillo3 fruta)))

;; 1. Buscar “pan”
(busqueda-almacen bodega ’pan)
;; 2. Buscar “queso”
(busqueda-almacen bodega ’queso)
;; 3. Buscar “fruta”
(busqueda-almacen bodega ’fruta)
