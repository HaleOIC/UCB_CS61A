#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))



(define (map p sequence)
  (accumulate (lambda (x y)
                (cons (if (not (pair? x))
                          (p x)
                          (map p x))
                      y))
              nil
              sequence))
;test
(map (lambda (x) (* x x)) (list 1 2 3 4))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1 ))
;test append
(append (list 1 2 3 4) (list 4 3 2 1))

(define (length sequence)
  (accumulate (lambda (first already-acc)
                (+ 1 already-acc))
              0 sequence))

;test
(length (list 1 2 3 (list 4 5)))