; Local Bindigns

#lang racket

(provide (all-defined-out))

; assumimos que eh uma unica lista e que possui apenas numeros para seguinte funcao:

(define (max-of-list xs) ; retorna o maior valor presente em uma lista
  (cond [(null? xs) (error "max-of-list given empty list")] ; se essa condicao for atendida, a execucao sera interrompida e a mensagem do erro retornada
        [(null? (cdr xs)) (car xs)] ; quando a lista possuir apenas um elemento, ele eh retornado
        [#t (let ([tlans (max-of-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))

(define (silly-double x)
  (let ([x (+ x 3)] ; valor de x eh alterado somente no escopo de let
        [y (+ x 2)]) ; valor de y existe apenas no escopo de let
    (+ x y -5))) ; operacao realizada com os valores presentes no escopo de let

(define (silly-double2 x)
  (let* ([x (+ x 3)]
         [y (+ x 2)]); o valor de x aqui eh o valor atualizado na linha anterior;
    (+ x y -8)))

; Funcao que verifica se um numero eh par ou impar
; Exemplificacao de quando letrec deve ser utilizado
(define (silly-mod2 x) ; retorna o resto da divisao por 2 do numero passado como argumento
  (letrec
      ([even? (lambda (x) (if (zero? x) #t (odd? (- x 1))))]
       [odd? (lambda (x) (if (zero? x) #f (even? (- x 1))))])
    (if (even? x) 0 1)))