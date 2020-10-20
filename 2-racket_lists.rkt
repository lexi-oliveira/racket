; Racket Lists
#lang racket

(provide (all-defined-out))

;soma todos os numeros presentes em uma lista
(define (sum xs)
  (if (null? xs) ; checa se a lista esta vazia
      0
      (+ (car xs) (sum (cdr xs))))) ;

; append (concatena duas listas)
(define (my-append xs ys)
  (if (null? xs) 
      ys
      (cons (car xs) (my-append (cdr xs) ys)))) ; cria uma lista iniciada com o primeiro elemento da primeira lista, percorre ela e depois retorna os elementos da segunda lista

; map (cria uma lista com base em uma funcao aplicada em valores de outra lista
(define (my-map f xs);f eh uma fun
  (if (null? xs)
      null
      (cons (f (car xs))
            (my-map f (cdr xs)))))
