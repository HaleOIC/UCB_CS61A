#lang sicp
(define lis1 (list 1 3 (list 5 7) 9))
(define lis2 (list (list 7)))
(define lis3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdaddr lis1))
(caar lis2)
(cadadr (cadadr (cadadr lis3)))