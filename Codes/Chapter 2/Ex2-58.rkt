#lang sicp

(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1) 
        (else (list a1 '+ a2)))) 

(define (sum? x) (and (pair? x) (eq? (cadr x) '+))) 
(define (addend s) (car s)) 
(define (augend s) (caddr s)) 

(define (make-product m1 m2) 
   (cond ((=number? m1 1) m2) 
         ((=number? m2 1) m1) 
         ((or (=number? m1 0) (=number? m2 0)) 0) 
         (else (list m1 '* m2)))) 

(define (product? x) (and (pair? x) (eq? (cadr x) '*))) 
(define (multiplier x) (car x)) 
(define (multiplicand x) (caddr x)) 