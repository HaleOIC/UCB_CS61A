#lang sicp
(define (make-product base1 exp1 base2 exp2)
  (cons (cons base1 exp1) (cons base2 exp2)))


(define (get tar pro)
  (cond ((= tar (car (car pro))) (cdr (car pro)))
        ((= tar (car (cdr pro))) (cdr (cdr pro)))
        (else (display "sorry, do not find you want!"))))

(define pro1 (make-product 2 4 3 5))
(get 2 pro1)
(get 3 pro1)
(get 4 pro1)
  
                                 
        