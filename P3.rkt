#lang scheme

;; Rotar la lista de funciones segun pedido en el enuciado aunque, por alguna razon, no
;; pusieron ningun ejemplo para ese caso >:(
(define (rotar ls)
    (if (null? ls)
        '()
        (append (cdr ls) (list (car ls)))) ;; Se elimina el primer elemento y lo agrega al final "rotandolo"
)

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