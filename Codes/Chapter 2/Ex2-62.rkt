#lang sicp
(define (make-set . x)
  x)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond
    ((or (null? set1) (null? set2))
     (cond ((null? set1) set2)
           (else set1)))
    ((and (null? set1) (null? set2)) '())
    ((= (car set1) (car set2)) (cons (car set1)
                                         (union-set (cdr set1)
                                                    (cdr set2))))
    ((< (car set1) (car set2)) (cons (car set1)
                                     (union-set (cdr set1) set2)))
    (else (cons (car set2) (union-set set1 (cdr set2))))))


(define set1 (make-set 1 2 3 4))
(define set2 (make-set 2 3 4 7))
(union-set set1 set2)