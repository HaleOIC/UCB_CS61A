#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs)  )
            (accumulate-n op init (map cdr seqs) ))))

(define (dot-product v w)
 (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
 (map (lambda (m-row)
        (dot-product v m-row)) m))

(define (transpose mat)
 (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row)
           (matrix-*-vector cols m-row))
         m)))



;test
(define matrix '((1 2 3 4)(4 5 6 6)(6 7 8 9)))
(define matrix1 (transpose matrix))
(dot-product (list 1 2 3) '(1 2 3))
(matrix-*-vector matrix (list 1 2 3 4))
(matrix-*-matrix matrix matrix1)