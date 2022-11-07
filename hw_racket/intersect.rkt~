#lang racket

; returns intersection of two lists
(define (intersect lst1 lst2)
  (my-quicksort (remove-duplicates (intersect-inner lst1 lst2)))
  )

;inner section of intersect function - returns unsorted intersection with duplicates
(define (intersect-inner lst1 lst2)
    (if (null? lst1)
      null
  (if (check (car lst1) lst2)
      (cons (car lst1) (intersect-inner (cdr lst1) lst2))
      (intersect-inner (cdr lst1) lst2)
      )
  )
 )

;remove duplicates
(define (remove-duplicates lon)
  (foldr (lambda (x y) (cons x (filter (lambda (z) (not (= x z))) y))) empty lon))

; check if element is in lst
(define (check e lst)
  (if (null? lst)
      #f
      (if (= (car lst) e)
          #t
          (check e (cdr lst))
          )
      )
  )

; quicksort
;=================================
;sorting alghorithm
(define (my-quicksort lst)
  (cond
    ((null? lst)                lst)
    ((null? (cdr lst))          lst)
    (#t                         (let (( pivot     (my-middle-element lst) ))
                                  (let ((left     (my-filter-gt lst pivot))
                                        (right    (my-filter-lt lst pivot))
                                        (mid      (my-filter-eq lst pivot)))
                                   (my-appendL (my-quicksort left)
                                              (my-appendL mid (my-quicksort right))))))))

;select middle element from list
(define (my-middle-element lst)
  (if (null? lst)
      null
      (my-middle-inner lst lst)
      )
  )

(define (my-middle-inner lst1 lst2)
  (cond
    ((null? lst2)        (car lst1))
    ((null? (cdr lst2))   (car lst1))
    (#t                  (my-middle-inner (cdr lst1) (cddr lst2)))
    )
  )
    
      


;returns list including only elements greater than n
(define (my-filter-gt lst n)
  (my-filter (lambda (x) (< x n)) lst)
  )

;returns list including only elements lower than n
(define (my-filter-lt lst n)
  (my-filter (lambda (x) (> x n)) lst)
  )

;return list including only elements equal to n
(define (my-filter-eq lst n)
  (my-filter (lambda (x) (= x n)) lst)
  )

;appends lst1 to lst2
(define (my-appendL lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1) (my-appendL (cdr lst1) lst2))))

;filter
(define (my-filter f lst)
  (if (null? lst)
          null
          (if (f (car lst))
              (cons (car lst) (my-filter f (cdr lst)))
              (my-filter f (cdr lst))
         )
  )
  )


 