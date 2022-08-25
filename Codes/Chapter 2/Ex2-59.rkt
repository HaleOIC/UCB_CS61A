#lang sicp

(define (make-set . x)
   x)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set))true)
        (else (element-of-set? x (cdr set)))))


(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))


(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))




(define setx (make-set 1 2 3 5 7))
(define sety (make-set 1 2 3 4 6))
(adjoin-set 4 sety)
(intersection-set setx sety)
(union-set setx sety)