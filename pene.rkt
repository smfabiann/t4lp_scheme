#lang scheme

(define (busqueda-almacen arbol producto)
    (define (buscar xs producto ruta)
    (if (null? xs)
        '()
        (let
            ((i (+ 1 (length ruta))))  ;; se crea varible i
            (if (list? (car xs))
                (append
                    (buscar (car xs) producto (append ruta (list i)))
                    (buscar (cdr xs) producto ruta)
                )
                (if (eq? (car xs) producto)
                    (cons (append ruta (list i)) (buscar (cdr xs) producto ruta))
                    (buscar (cdr xs) producto ruta)
                )
            )
        )))
    (buscar (cdr arbol) producto '()))

(define bodega
    '(bodega
        (pasillo1 leche pan)
        (pasillo2 (estanteA pan queso) (estanteB manzana pan))
        (pasillo3 fruta)))

;; Pruebas
(busqueda-almacen bodega 'pan)    ; => '((1 2) (2 1 1) (2 2 2))
(busqueda-almacen bodega 'queso)  ; => '((2 1 2))
(busqueda-almacen bodega 'fruta)  ; => '((3 1))