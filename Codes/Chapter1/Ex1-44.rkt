#lang sicp
(define dx 0.00001) 
  
(define (smooth f) 
  (lambda (x) 
    (/ (+ (f (- x dx)) 
          (f x) 
          (f (+ x dx))) 
       3))) 

(define (n-fold-smooth f n) 
  ((repeated smooth n) f))

(define (repeated f n )
  (lambda (x)
    (define (iter times)
      (if (= times n)
          (f x)
          (f (iter (+ times 1)))
          ))
    (iter 1)))