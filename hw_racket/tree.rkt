#lang racket

#|
Vyvážení stromu

Napište funkci is-balanced?, která přijímá jako argument binární strom a vrátí #t pokud je strom vyvážený, v opačném případě vrátí #f.
Strom považujeme za vyvážený, pokud pro každý jeho vrchol platí, že se výšky jeho podstromů neliší o více než 1.
|#

;returns true if tree is balanced else false


(define (is-balanced? lst)
  (if (null? lst)
      #t
      (if (equal?(is-balanced-inner? lst 0) #f)
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
         (if (check left right)
             (if (> left right)
                 left
                 right
                 )
             #f)
      )
   )
  )



(define (check val1 val2)
  (cond
    [(equal? val1 #f)             #f]
    [(equal? val2 #f)             #f]
    [(equal? -1 ( - val1 val2))   #t]
    [(equal? 1  ( - val1 val2))   #t]
    [(equal? 0  ( - val1 val2))   #t]
    [#t                           #f]   
    )
  )

                  
      
                            