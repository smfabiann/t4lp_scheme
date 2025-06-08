#lang scheme

;; retorna true cuando la longitud de las 'lista' es la misma que el numero 'n'
;;
;; n : int a comparar con la longitud de la lista
;; ls : la lista con la que se compara n
(define (coincide? n ls)
    (if (null? ls)
        (if (= n 0)    ;; se verifica si el n es 0, caso para detener la recursión
            true    ;; si es 0, se devuelve true, significando que hay una misma cantidad e elementos
            false)  ;; si se agora la lista y el n no es 0, se devuelve false, significando que no tienen la misma cantidad
        ;; se le resta 1 al n y se devuelve la lista sin el primer elemento
        (coincide? (- n 1) (cdr ls)) ;; Recurcion en cola
    )
)

;; ejemplos del pdf
(coincide? 3 '(pan ketchup lechuga))
(coincide? 0 '( ) )
(coincide? 2 '( hamburguesa queso tomate ) )