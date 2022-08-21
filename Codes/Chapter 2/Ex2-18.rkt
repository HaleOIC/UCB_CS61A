#lang sicp
; nil
(define nil '())


(define (reverse items)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (car list) result))))
  (if (null? items)
      (list )
      (iter (cdr items)(cons (car items) nil))))

(reverse (list 1 4 9 16 25))