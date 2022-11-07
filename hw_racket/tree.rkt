#lang racket

;returns true if tree is balanced else false
(define (is-balanced? lst)
  (if (null? lst)
      #t
      (check (is-balanced-inner? lst 0))
  )
  )

;returns list of all max depths
(define (is-balanced-inner? lst depth)
  (if (null? lst)
      depth
      (cons (is-balanced-inner? (cadr lst) (+ depth 1)) (cons (is-balanced-inner? (caddr lst) (+ depth 1)) null)))
         )

; checks if every list element is equal 
(define (check lst)
  (if (null? (cdr lst))
      #true
      (equal? (car lst) (cadr lst))
      )
  )
                  
      
                            