#lang sicp
(define (sum-of-square x y)
  (+ (square x)
     (square y)))

(define (square x)
  (* x x))

(define (bigger x y)
  (if (< x y)
      y
      x))
(define (smaller x y)
  (if (> x y)
      y
      x))
(define (calculate x y z)
  (sum-of-square(bigger x y)
                (bigger(smaller x y)z)))