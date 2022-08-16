#lang sicp
; iterative product
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
;recursive product
#|
(define (product term a next b)
  (define (iter a)
    (if (> a b)
        1
        (* (term a) (iter (next a)))))
  (iter a))
|#

;the procedure to calculate the factorai as follows
(product (lambda (x) x ) 1 (lambda (x) (+ x 1)) 3)


;the procedure to calculate the Pi as follows
(define n 10000)
(define f (lambda (x)
            (if (not(even? x))
                (/ (+ x 1) (+ x 2))
                (/ (+ x 2) (+ x 1)))))
(define ans (* 4 (product f 1 (lambda (x) (+ x 1)) n)))
(exact->inexact ans)
  

             


                                  