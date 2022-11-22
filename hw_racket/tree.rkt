#lang racket

;returns true if tree is balanced else false
(define (is-balanced? lst)
  (if (null? lst)
      #t
      (if (boolean? (is-balanced-inner? lst 0))
          #f
          #t
          )
  )
  )

;returns list of all max depths
(define (is-balanced-inner? lst depth)
  (if (null? lst)
      depth
      (let ([left (is-balanced-inner? (cadr lst) (+ depth 1))]
           [right (is-balanced-inner? (caddr lst) (+ depth 1))])
         (if (check-2 left right)
             (if (> left right)
                 left
                 right
                 )
             #f)
      )
   )
  )

; checks if every list element is equal 
(define (check lst)
  (if (null? (cdr lst))
      #true
      (equal? (car lst) (cadr lst))
      )
  )

(define (check-2 val1 val2)
  (cond
    [(equal? val1 #f)             #f]
    [(equal? val2 #f)             #f]
    [(equal? -1 ( - val1 val2))   #t]
    [(equal? 1  ( - val1 val2))   #t]
    [(equal? 0  ( - val1 val2))   #t]
    [#t                           #f]   
    )
  )

                  
      
                            