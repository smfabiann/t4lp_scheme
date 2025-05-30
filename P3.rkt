#lang scheme

;; Rotar la lista de funciones segun pedido en el enuciado aunque, por alguna razon, no
;; pusieron ningun ejemplo para ese caso >:(
;;
;; ls : lista de funciones
(define (rotar ls)
    (if (null? ls)
        '()
        (append (cdr ls) (list (car ls)))) ;; Se elimina el primer elemento y lo agrega al final "rotandolo"
)

;; Retorna una lista de resultados aplicando las funciones de la lista 'fs' a los elementos de de la
;; lista 'xs' a partir de un elemento base 'inicio'. 
;;
;; fs : lista de funciones
;; inicio : valor inicial donde se acumula el resultado de aplicar las funciones
;; xs : lista de elementos en las que se aplican las funciones
(define (secuencia-rotacional fs inicio xs)
    (if (null? xs)
        '()
        (cons   ;; operacion para que funcione la recursividad
            ((car fs) inicio (car xs))
            (secuencia-rotacional (rotar fs) ((car fs) inicio (car xs)) (cdr xs))
        ))
)

(secuencia-rotacional
(list (lambda (ac x) (+ ac x)))
0
'(1 2 3 4))

(secuencia-rotacional
(list (lambda (ac x) (* ac x)))
1
'(2 3 4))

(secuencia-rotacional
(list (lambda (ac x) (string-append ac x "-")))
""
'("pan" "queso" "tomate"))