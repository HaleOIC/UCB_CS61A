#lang sicp
;;; PART III

(define abs
  (lambda (a)
    (if (> a 0)
        a
        (- a))))