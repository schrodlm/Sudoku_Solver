#lang racket


(define (matrix-mul mat1 mat2)
  (if (null? mat1)
      null
      (cons (my-multiply (car mat1) mat2) (matrix-mul (cdr mat1) mat2)
            )
      )
  )

(define (my-multiply row mat2)
  (if (null? (cdr mat2))
      (map (lambda (x) (* x (car row))) (car mat2))
      (addLists (map (lambda (x) (* x (car row))) (car mat2)) (my-multiply (cdr row) (cdr mat2)))
      )
  )


(define (addLists l1 l2)
  (if (null? l1)
      null
      (cons (+ (car l1) (car l2)) (addLists (cdr l1) (cdr l2)))
      )
  )
           
        
  