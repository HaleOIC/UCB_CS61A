#lang sicp

(define (encode message tree) 
  (if (null? message) 
      '() 
      (append (encode-symbol (car message) tree) 
              (encode (cdr message) tree)))) 

  
(define (encode-symbol char tree) 
  (cond ((leaf? tree) '()) 
        ((memq char (symbols (left-branch tree))) 
         (cons 0 (encode-symbol char (left-branch tree)))) 
         ((memq char (symbols (right-branch tree))) 
          (cons 1 (encode-symbol char (right-branch tree)))) 
         (else (error "symbol not in tree" char)))) 