#lang sicp
;;; using new (next guess) replace (+ guess 1)
(define (next p)
  (if (even? p) (+ p 3) (+ p 2)))
(define (smallest-divisor p)
  (find-divisor p 2))

(define (find-divisor tar guess)
  (if (divides? tar guess)
      guess
      (find-divisor tar (next guess))))
(define (divides? y x)
  (= (remainder y x) 0))



(smallest-divisor 19999)