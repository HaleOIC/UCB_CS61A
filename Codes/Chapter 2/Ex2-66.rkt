#lang sicp


(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (lookup key set)  
  (if (null? set) false
      (let ((parent (entry set))) 
        (cond ((eq? parent '()) false) 
              ((= key parent) parent) 
              (else 
               (lookup key 
                       (if (< key parent) 
                           (left-branch set) 
                           (right-branch set)))))))) 