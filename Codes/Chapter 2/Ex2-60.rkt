#lang sicp
(define (make-set . x)
  x)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= (car set) x) true)
        (else (element-of-set? x (cdr set)))))
(define (adjoin-set x set)
  (cons x set))
(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))


(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))



(define setx (make-set 1 2 3 3 5 7 7))
(define sety (make-set 1 2 2 3 3 4 6))
(adjoin-set 4 sety)
(intersection-set setx sety)
(union-set setx sety)