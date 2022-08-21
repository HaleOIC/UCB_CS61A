#lang sicp
(define (flatmap proc seq)
 (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (+ low 1) high)))) 

(define (unique-tuples n k) 
  (define (iter m k) 
    (if (= k 0) 
        (list nil) 
        (flatmap (lambda (j) 
                   (map (lambda (tuple) (cons j tuple)) 
                        (iter (+ j 1) (- k 1)))) 
                 (enumerate-interval m n)))) 
  (iter 1 k))
(define (triples-of-sum s n) 
  (filter (lambda (seq) (= (accumulate + 0 seq) s)) 
          (unique-tuples n 3))) 
(triples-of-sum 20 30) 
