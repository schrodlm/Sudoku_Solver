#lang racket

;appends element to the end of the list
(define (my-append x list)
  (if (null? list)
      (cons x null)
      (cons (car list) (my-append x (cdr list)))
      )
  )

;reverses given list
(define (my-reverse x)
  (if (null? x)
      null
      (my-append (car x) (my-reverse (cdr x)))
      )
  )

; check every element
(define (check lst1 lst2)
  (if (null? (cdr lst1))
      #t
      (if (list? (car lst2))
          (if (list? (car lst1))
              (check (car lst1)  (car lst2))
              #f
              )
          (if (= (car lst2) (car lst1))
              (check (cdr lst1) (cdr lst2))
              #f
          )
          )
      )
  )
;lenght of the palindrome
(define (lst-lenght lst acc)
  (if (null? lst)
      acc
      (lst-lenght (cdr lst ) (+ acc 1))
      )
  )

;is palindrome
(define (is-palindrome? lst)
  (if (<= (lst-lenght lst 0) 1)
      #t
      (check (cdr lst) (cdr (my-reverse lst)))
      )
  )
  