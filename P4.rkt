#lang scheme

;; Funcion que busca las rutas hacia un producto en un arbol N-ario.
;; Retorna una lista de rutas (listas de indices) utilizadas para encontrar este producto.
;;
;; arbol : lista compuesta, en este caso la bodega en el que se busca el prcudto
;; producto : elemento que se esta buscado
(define (busqueda-almacen arbol producto)
    ;; Funcion auxiliar recursiva que busca el producto y guarda la ruta que se recorre.
    ;; No se que hay que hacer cuando el producto no existe, asi que, asumi que no hay que colocar retornar
    ;; una lista de busqueda (lista vacio).
    ;;
    ;; ls : lista/sublista que se recorrerá
    ;; ruta : lista donde se guarda los incides del recorrido en el arbol
    (define (buscar ls ruta)
        ;; Otra funcion auxiliar que ayuda a recorre/itera la la lista/sublista y guardando el recorrido.
        ;;
        ;; xs : lista  que se recorre
        ;; i : indice (empieza en 1 por el primer elemento, 'bodega')
        ;; acc : acumula la ruta encontrada (los indices)
        (define (iter xs i acc)
            (if (null? xs)
                acc
                (let ((elem (car xs)))
                    (if (list? elem)
                        ;; si es que ecnuentra una lista, entra a la sublista (car elem)y se pasa (cdr elem)
                        (iter (cdr xs) (+ i 1)
                               (append acc (buscar (cdr elem) (append ruta (list i)))))
                        ;; si es que encuentra el producto buscado, se agrega la ruta
                        (if (eq? elem producto)
                            (iter (cdr xs) (+ i 1)
                                (append acc (list (append ruta (list i)))))
                            (iter (cdr xs) (+ i 1) acc))))))
        ;; se empueza el recorrido desde el indice 1, porque en el 0 esta 'bodega'
        (iter ls 1 '()))
    ;; se ignora 'bodega' y se empieza a buscar el producto en el arbol
    (buscar (cdr arbol) '()))

;; definicion de la bodega, lo que estaba en el pdf.
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))

;; ejemplos del pdf
(busqueda-almacen bodega 'pan)
(busqueda-almacen bodega 'queso)
(busqueda-almacen bodega 'fruta)