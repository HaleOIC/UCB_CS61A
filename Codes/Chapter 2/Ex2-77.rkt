#lang sicp
  
(define (apply-generic op . args) 
  ;; as seen in 2.4.3 
  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) ;; <- here is where Louis gets in trouble 
      (if proc 
          (apply proc (map contents args)) 
          (error 
           "no method for these types -- APPLY-GENERIC" 
           (list op type-tags)))))) 

(define (install-polar-package) 
  (define (magnitude z) (car z)) 
   ... 
  (put 'magnitude '(polar) magnitude) 
  ... 
  'done) 

(define install-rectangular-package) 
... 
   (define (magnitude z) 
     (sqrt (+ (square (real-part z) (imag-part z)))) 
     ... 
     (put 'magnitude 'rectangular magnitude) 
     ... 
     'done) 

(define (magnitude z) 
  (apply-generic 'magnitude z)) 
