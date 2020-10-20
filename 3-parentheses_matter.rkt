; Importancia dos parenteses
#lang racket

(provide (all-defined-out))

(define (fact n) (if (= n 0) 1 (* n (fact (- n 1)))))

(define (fact1 n) (if (= n 0) (1) (* n (fact1 (- n 1))))) ; neste caso, nao ha um identificador de tipo que distingue (1) como inteiro ou uma funcao, entao acaba sendo uma funcao com 0 argumentos e um retorno vazio

(define (fact1b n) (if (= n 0) (1) (* n (fact (- n 1))))) ; neste caso nao funcionara com o argumento 0, pois se enquadra no caso a cima
; a funcao acima funciona para outros argumentos alem de 0 pois sua chamada recursiva eh para fact, que esta corretamente implementada

;(define (fac2 n) (if = n 0 1 (* n (fact2 (- n 1))))); erro de sintaxe pois ha mais argumentos do que o necessario na funcao if

;(define fact3 (n) (if (= n 0) 1 (* n (fact (- n 1))))) ; erro de sintaxe: fact3 esta sendo definido como valor e nao uma funcao

(define (fact4 n) (if (= n 0) 1 (* n fact4 (n - 1)))) ; funciona com argumento 0 mas aconte um erro de execucao se o numero for maior que zero
; o erro se da pelo falo de esperar fact4 como um valor, e quando eh chamado sem o parentese que indica que eh uma funcao, nao consegue obter o valor de fact4

(define (fact5 n) (if (= n 0) 1 (* n ((fact5) (- n 1))))) ; funciona com argumento 0 mas aconte um erro de execucao se o numero for maior que zero
; o erro aqui acontece devido a fact5 ser chamada como um funcao com 0 argumentos na multiplicacao sendo que foi definida como uma funcao possuindo um argumento

(define (fact6 n) (if (= n 0) 1 (n * (fact6 (- n 1))))) ; funciona com argumento 0 mas aconte um erro de execucao se o numero for maior que zero
; o erro aqui eh que n eh chamado como uma funcao e nao a funcao de multiplicacao em si (tomar cuidado com a ordem na chamada de funcao)
