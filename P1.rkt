#lang scheme

;; retorna true cuando la longitud de las 'lista' es la misma que el numero 'n'
;;
;; numero : int a comparar con la longitud de la lista
;; lista : la lista con la que se compara n
(define (coincide? numero lista)
    (if (null? lista)
        (if (= numero 0)    ;; se verifica si el numero es 0, caso para detener la recursión
            true    ;; si es 0, se devuelve true, significando que hay una misma cantidad e elementos
            false)  ;; si se agora la lista y el numero no es 0, se devuelve false, significando que no tienen la misma cantidad
        ;; se le resta 1 al numero y se devuelve la lista sin el primer elemento
        (coincide? (- numero 1) (cdr lista)) ;; Recurcion en cola
    )
)

(coincide? 3 '(pan ketchup lechuga))
(coincide? 0 '( ) )
(coincide? 2 '( hamburguesa queso tomate ) )