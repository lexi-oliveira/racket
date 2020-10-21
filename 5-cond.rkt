; Cond
#lang racket

(provide (all-defined-out))

; utiliza a funcao de sum de 4-dynamic_typing.rkt
; so que agora nao utiliza if's para avalicao e sim cond

(define (sum4 xs) ; funcao equivalente a sum1 presente em 4-dynamic_typing.rkt
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum4 (cdr xs)))]
        [#t (+ (sum4 (car xs)) (sum4 (cdr xs)))])) ; se for uma lista, percorre e soma seus elementos recursivamente.
; so aceita listas com elementos numericos

(define (sum5 xs) ; funcao equivalente a sum2 presente em 4-dynamic_typing.rkt
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum5 (cdr xs)))]
        [(list? (car xs)) (+ (sum5 (car xs)) (sum5 (cdr xs)))]
        [#t (sum5 (cdr xs))]))

(define (count-falses xs) ; demonstracao de que qualquer valor valor diferente de #f eh considerado como #t em Racket
  (cond [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))] ; qualquer valor diferente de #f eh visto como #t, entao ele confere recursivamente o proximo elemento da lista
        [#t (+ 1 (count-falses (cdr xs)))])) ; sendo #f, incrementa +1 na contagem
