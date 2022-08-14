#lang sicp
(define (calc x y)
  (if (or (= x 0) (= y 0) (> y x))
      0
      (if (or (= x 1) (= y 1) (= x y))
          1
          (+ (calc (- x 1) y) (calc (- x 1) (- y 1))))))
(calc 5 3)