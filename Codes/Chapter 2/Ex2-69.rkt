#lang sicp
  
(define (generate-huffman-tree pairs) 
  (define (order-tree-set tree tree-set) 
    (cond ((null? tree-set) (list tree)) 
          ((>= (weight (car tree-set)) (weight tree)) 
           (cons tree tree-set)) 
          ((< (weight (car tree-set)) (weight tree)) 
           (cons (car tree-set) 
                 (order-tree-set tree (cdr tree-set)))))) 
  (define (successive-merge leaf-set) 
    (cond ((null? leaf-set) nil) 
           ((null? (cdr leaf-set)) (car leaf-set)) 
           (else 
            (let ((new-tree (make-code-tree (cadr leaf-set) 
                                            (car leaf-set)))) 
              (successive-merge (order-tree-set new-tree 
                                                (cddr leaf-set))))))) 
  (successive-merge (make-leaf-set pairs))) 

(define (successive-merge trees) 
   (let ((lightest-tree (car trees)) (heavier-trees (cdr trees))) 
     (if (null? heavier-trees) 
         lightest-tree 
         (successive-merge (adjoin-set (make-code-tree lightest-tree (car heavier-trees)) 
                                       (cdr heavier-trees)))))) 