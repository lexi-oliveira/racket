; Dinamic Typing
#lang racket

(provide (all-defined-out))

; dinamic typing: podemos usar valores de qualquer tipo em qualquer lugar
; ex: uma lista que contem numeros ou outras listas - com
; suas proprias listas ou numeros

(define xs (list 4 5 6))
(define ys (list (list 4 (list 5 0)) 6 7 (list 8) 9 2 3 (list 0 1)))

(define (sum1 xs) ; funcao que soma todos os numeros presentes em uma lista e suas sublistas 
  (if (null? xs)
      0
      (if (number? (car xs)) ; verifica se eh um numero
         (+ (car xs) (sum1 (cdr xs))) ; caso sim, soma o numero encontrado e chama recursivamente para o proximo elemento da lista
         (+ (sum1(car xs)) (sum1 (cdr xs)))))); caso nao, chama sum1 recursivamente para somar os elementos dessa sublista encontrada e tambem chama sub1 para os outros elementos presentes na sublista

(define (sum2 xs) ; funcao que soma numeros presentes em uma lista e suas sublistas mas pula elementos que nao sao numericos
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum2 (cdr xs)))
          (if (list? (car xs)) ; verifica se eh uma lista
              (+ (sum2 (car xs)) (sum2 (cdr xs))) ; se sim, soma elemento presente na cabeca da lista e percorre recursivamente sua cauda
              (sum2 (cdr xs)))))) ; se nao eh uma lista, nao faz nada e chama recursivamente o elemento seguinte

; Atividade definida para tratar qualquer tipo dado como argumento da funcao sum3
; Eh uma adaptacao do sum2
(define (sum3 xs)
  (if (not (list? xs))
      0
      (if (null? xs)
          0
          (if (number? (car xs))
              (+ (car xs) (sum3 (cdr xs)))
              (if (list? (car xs))
                  (+ (sum3 (car xs)) (sum3 (cdr xs)))
                  (sum3 (cdr xs)))))))
          
