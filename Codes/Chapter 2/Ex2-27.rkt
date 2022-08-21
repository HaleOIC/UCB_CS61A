#lang sicp
(define (reverse items)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (car list) result))))
  (if (null? items)
      (list )
      (iter (cdr items)(cons (car items) nil))))

(define (deep-reverse x) 
  (if (pair? x) 
      (append (deep-reverse (cdr x))  
              (list (deep-reverse (car x)))) 
      x)) 

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)