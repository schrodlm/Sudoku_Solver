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
  (cons (filter f lst) (cons (my-neg-filter f lst) null))
  )


(define (my-neg-filter f lst)
  (if (null? lst)
      null
      (if (f (car lst))
          (my-neg-filter f (cdr lst))
          (cons (car lst) (my-neg-filter f (cdr lst)))
          )
      )
  )