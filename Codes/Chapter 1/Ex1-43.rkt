#lang sicp
(define (repeated f n )
  (lambda (x)
    (define (iter times)
      (if (= times n)
          (f x)
          (f (iter (+ times 1)))
          ))
    (iter 1)))

(define square(lambda (x) (* x x)))
((repeated square 2) 5)