#lang racket

;returns true if tree is balanced else false
(define (is-balanced? lst)
  (let ([x (is-balanced-inner? lst 0)])
     (check x)
  )
  )

;returns list of all max depths
(define (is-balanced-inner? lst depth)
  (if (null? lst)
      depth
      (list (is-balanced-inner? (cadr lst) (+ depth 1)) (is-balanced-inner? (caddr lst) (+ depth 1))))
         )

; checks if every list element is equal 
(define (check lst)
  (if (null? (cdr lst))
      #t
      (equal? (car lst) (cadr lst))
      )
  )
                  
      
                            