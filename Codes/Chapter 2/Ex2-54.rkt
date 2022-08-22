#lang sicp
(define (equal obj1 obj2)
  (if (pair? obj1)
      (if (pair? obj2)
          (and (equal (car obj1) (car obj2))
               (equal (cdr obj1) (cdr obj2)))
          false)
      (if (pair? obj2)
          false
          (eq? obj1 obj2))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))

          