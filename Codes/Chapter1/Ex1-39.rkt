#lang sicp
(define (tan-cf x k)
  (define (iter times)
    (if (= times k)
        0
        (/ (* x x) (- (- (* 2 times) 1.0) (iter (+ 1 times))))))
  (iter 1))
(define k 10000)
(tan-cf 1 k)
