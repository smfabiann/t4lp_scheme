#lang scheme

;; Funcion con recursion en cola. A partir de una base 'inicio' realiza una operacion 'f' con cada
;; numero de la lista 'ls' el resultado se va acumulando en 'inicio'. Retorna 'inicio' como resultado final.
;;
;; f : funcion/operacion que se aplica a inicio por cada elemento de la lista
;; inicio : valor inicial donde se acumula el resultado de aplicar f a cada elemento de la lista
;; ls : lista de numeros
(define (mezclador-gourmet-cola f inicio ls)
    (if (null? ls)
        inicio ;; No sabia que display no era necesario
        (mezclador-gourmet-cola f (f inicio (car ls)) (cdr ls)))
)


;; Funcion con recursion simple. A partir de una base 'inicio' realiza una operacion 'f' con cada
;; numero de la lista 'ls' el resultado se va acumulando en 'inicio'. Retorna 'inicio' como resultado final.
;;
;; f : funcion/operacion que se aplica a inicio por cada elemento de la lista
;; inicio : valor inicial donde se acumula el resultado de aplicar f a cada elemento de la lista
;; ls : lista de numeros
(define (mezclador-gourmet-simple f inicio ls)
    (if (null? ls)
        inicio
        (f (car ls) (mezclador-gourmet-simple f inicio (cdr ls))))
)
     

(mezclador-gourmet-simple + 0 '(8000 12000 15000))
(mezclador-gourmet-cola + 0 '(8000 12000 15000))
(mezclador-gourmet-simple * 1 '(2 3 4))
(mezclador-gourmet-cola * 1 '(2 3 4))
