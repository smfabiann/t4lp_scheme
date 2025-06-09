#lang scheme

;; Funcion auxiliar de coincide?.
;; Retorna una cantidad de elementos en la lista ls.
;;
;; ls : lista cuyos elementos se van a contar
(define (longa ls)
    (if (null? ls)
        0
        (+ 1 (longa (cdr ls)))))

;; Funcion que compara el largo de una lista "ls" con una cantidad "n".
;;
;; n : numero a comparar con la longitud de la lista
;; ls : lista cuyos elementos se van a contar
(define (coincide? n ls)
    (if (eq? n (longa ls))
        true
        false)
)

;; ejemplos del pdf
(coincide? 3 '(pan ketchup lechuga))
(coincide? 0 '( ) )
(coincide? 2 '( hamburguesa queso tomate ) )