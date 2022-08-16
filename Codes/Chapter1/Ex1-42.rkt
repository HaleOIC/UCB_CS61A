#lang sicp
(define (compose f g)
  (lambda (x) (f(g x))))
(define square (lambda (x) (* x x)))
((compose square inc) 6)