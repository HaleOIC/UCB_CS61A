#lang sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (branch-length tar)
  (car tar))
(define (branch-structure tar)
  (cdr tar))
(define (left-branch tar)
  (car tar))
(define (right-branch tar)
  (cdr tar))


(define (total-weight tar)
  (if (number? tar)
      tar
      (+ (total-weight (branch-structure (left-branch tar)))
         (total-weight (branch-structure (right-branch tar))))))

(define (check-balance tar)
  (if (number? tar)
      true
      (if (not (and (check-balance (branch-structure(left-branch tar)))
                    (check-balance (branch-structure(right-branch tar)))))
          false
          (if (= (* (total-weight (branch-structure(left-branch tar)))
                    (branch-length (left-branch tar)))
                 (* (total-weight (branch-structure(right-branch tar)))
                    (branch-length (right-branch tar))))
              true
              false))))


;; if change in that way, nothing to be changed
          
          
  