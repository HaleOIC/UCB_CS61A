#lang sicp

(define (calc f a b n)
    (Simpson f a b n))

(define (Simpson f a b n)
  (let ((h (/ (+ a b) n)))
    (define next (lambda (x) (+ x 1)))
    
    (define figure (lambda (x)
                     (cond ((even? x)
                            (* 4 (f (+ a (* x h)))))
                           (else (* 2 (f (+ a (* x h))))))))
    
    (define (Simp-iter f base) 
     (cond ((= base n) (f b))
           ((= base 0) (+ (f a) (Simp-iter f (next base))))
           (else (+ (figure base) (Simp-iter f (next base))))
           ))
  
  
    (* (/ h 3) (Simp-iter f 0))))
        


(exact->inexact (calc (lambda (x) (* x x x)) 0 1 10000))