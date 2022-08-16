#lang sicp
(define (f g)
  (g 2))

(define square (lambda (x) (* x x)))

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f)
;It can not run because 2 is a number, not a procedure