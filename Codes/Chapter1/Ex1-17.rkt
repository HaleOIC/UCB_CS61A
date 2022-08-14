#lang sicp

(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

(define (multi a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (multi a (halve b))))
        ((odd? b)
         (+ a (multi a (- b 1))))))
         