#lang scheme

(define (mezclador-gourmet-cola f inicio ls)
    (if (null? ls)
        inicio ;; No sabia que display no era necesario
        (mezclador-gourmet-cola f (f inicio (car ls)) (cdr ls)))
)


(define (mezclador-gourmet-simple f inicio ls)
    (if (null? ls)
        inicio
        (f (car ls) (mezclador-gourmet-simple f inicio (cdr ls))))
)
     

(mezclador-gourmet-simple + 0 '(8000 12000 15000))
(mezclador-gourmet-cola + 0 '(8000 12000 15000))
(mezclador-gourmet-simple * 1 '(2 3 4))
(mezclador-gourmet-cola * 1 '(2 3 4))
