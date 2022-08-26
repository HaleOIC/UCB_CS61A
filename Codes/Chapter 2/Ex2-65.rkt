#lang sicp
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (union-set a b) 
  (cond ((null? a) b) 
        ((null? b) a) 
         (else 
          (let ((a-entry (entry a)) 
                (a-left-branch (left-branch a)) 
                (a-right-branch (right-branch a)) 
                (b-entry (entry b)) 
                (b-left-branch (left-branch b)) 
                (b-right-branch (right-branch b))) 
            (cond ((= a-entry b-entry) 
                   (make-tree a-entry 
                              (union-set a-left-branch b-left-branch) 
                              (union-set a-right-branch b-right-branch))) 
                  ((< a-entry b-entry) 
                   (make-tree b-entry 
                              (union-set a b-left-branch) 
                              b-right-branch)) 
                  ((> a-entry b-entry) 
                   (make-tree a-entry 
                              (union-set a-left-branch b) 
                              a-right-branch))))))) 

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
 (if (= n 0)
     (cons '() elts)
     (let ((left-size (quotient (- n 1) 2)))
       (let ((left-result (partial-tree elts left-size)))
         (let ((left-tree (car left-result))
               (non-left-elts (cdr left-result))
               (right-size (- n (+ left-size 1))))
           (let ((this-entry (car non-left-elts))
                 (right-result (partial-tree (cdr non-left-elts)
                                             right-size)))
 (let ((right-tree (car right-result))
       (remaining-elts (cdr right-result)))
   (cons (make-tree this-entry left-tree right-tree)
         remaining-elts))))))))
(define (intersection-set a b) 
  (cond ((null? a) '()) 
        ((null? b) '()) 
        (else 
         (let ((a-entry (entry a)) 
               (a-left-branch (left-branch a)) 
               (a-right-branch (right-branch a)) 
               (b-entry (entry b)) 
               (b-left-branch (left-branch b)) 
               (b-right-branch (right-branch b))) 
           (cond ((= a-entry b-entry) 
                  (make-tree a-entry 
                             (intersection-set a-left-branch b-left-branch) 
                             (intersection-set a-right-branch b-right-branch))) 
                 ((< a-entry b-entry) 
                  (union-set 
                   (intersection-set a-right-branch 
                                     (make-tree b-entry '() b-right-branch)) 
                   (intersection-set (make-tree a-entry a-left-branch '()) 
                                      b-left-branch))) 
                 ((> a-entry b-entry) 
                  (union-set 
                   (intersection-set (make-tree a-entry '() a-right-branch) 
                                     b-right-branch) 
                   (intersection-set a-left-branch 
                                     (make-tree b-entry b-left-branch '()))))))))) 

(intersection-set (list->tree '(3 5 10)) 
                  (list->tree '(1 2 3 4 5 7)))

(union-set (list->tree '(1 3 5)) 
           (list->tree '(2 3 4))) 