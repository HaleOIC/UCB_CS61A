#lang sicp
(define (calc a b sum)
  (cond ((= b 0) sum)
        ((even? b) (calc (double a)
                        (halve b)
                        sum))
       ((odd? b) (calc a
                       (- b 1)
                       (+ sum a)))))
       

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (multi x y)
  (calc x y 0))
  

(multi 3 4)
               
                       