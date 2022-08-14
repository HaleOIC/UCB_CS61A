#lang sicp

(define (calc_1 n)
  (R-pro n))
(define (calc_2 n)
  (I-pro n))


(define (R-pro n)
  (if (> n 3)
      (+ (R-pro (- n 1)) (* 2 (R-pro (- n 2))) (* 3 (R-pro (- n 3))))
      n))

(define (I-pro n)
  (if (< n 3)
      n
      (iter n 3 2 1 3)))
(define (iter n a b c step)
  (if (= step n)
      a
      (iter n
            (+ a (* 2 b) (* 3 c))
            a
            b
            (+ step 1))))