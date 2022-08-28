#lang sicp


(define (encode-symbol symbol tree)
  (define (iter-encode symbol tree result)
    (if (leaf? tree)
        result
        (if (memq symbol (symbols (left-branch tree)))
                (iter-encode symbol (left-branch tree) 
                             (append result (list 0)))
                (iter-encode symbol (right-branch tree) 
                             (append result (list 1))))))
  (if (memq symbol (symbols tree))
      (iter-encode symbol tree '())
      (error "bad symbol -- ENCODE-SYMBOL" symbol)))


; the speed of the growth is O (n log n)