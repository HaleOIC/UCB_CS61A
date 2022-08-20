#lang sicp
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define x 1)
(define y 2)

(car (cons x y))
(cdr (cons x y))