#lang sicp

(define (make-set . x)
  x)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))


(define (adjoin-set element set)
  (define (join value set)
    (cond ((null? set) (list value))
          ((< value (car set)) (cons value set))
          (else (cons (car set)(join value (cdr set))))))  
  (if (element-of-set? element set)
      set
      (join element set)))



(define set1 (make-set 1 2 3 4))
(define set2 (make-set 2 3 4 7))
(adjoin-set 2 set1)
(adjoin-set 5 set2)