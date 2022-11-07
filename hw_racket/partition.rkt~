#lang racket

(define (partition-by-l f lst)
  (if (null? lst)
      '(()())
      (let ([x (partition-by-l f (cdr lst))])
        (if (f (car lst))
            (list (cons (car lst) (car x)) (cadr x))
            (list (car x) (cons (car lst) (cadr x)))
            )
        )
      )
  )

(define (partition-by f lst)
  (list (filter f lst) (filter (negate f) lst)))