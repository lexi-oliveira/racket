#lang racket

(provide (all-defined-out))

(define x 3) ; val x = 3
(define y (+ 2 x)) ; + is a function that adds two values

(define cube1
  (lambda (x)
    (* x (* x x)))); x * (x * x)

(define cube2
  (lambda (x)
    (* x x x))) ;  multiply, in this language, is a function that can take any number of arguments

(define (cube3 x) ;is a anonymous functions defined without lambda function, more arguments can be include after x
  (* x x x))

(define (pow1 x y) ; x to the yth power (y must be nonnegative)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define three-to-the (pow2 3))


