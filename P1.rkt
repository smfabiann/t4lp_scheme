#lang scheme

;; funcion auxiliar de coinside
;; da la longitud de una lista
(define (longa ls)
    (if (null? ls)
        0
        (+ 1 (longa (cdr ls)))))

(define (coincide? n ls)
    (if (eq? n (longa ls))
        true
        false)
)

;; ejemplos del pdf
(coincide? 3 '(pan ketchup lechuga))
(coincide? 0 '( ) )
(coincide? 2 '( hamburguesa queso tomate ) )