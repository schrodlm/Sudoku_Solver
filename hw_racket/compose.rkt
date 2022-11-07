#lang racket

;(define (compose-chain flist)
  ;(if (null?)


;lambda applied on lambda applied on 5
;((lambda (e) (+ e 1)) ((lambda (e) (* e 2)) 5) )
; = 11

; apply both function to their arguments
;`(,((lambda (e) (+ e 1)) 5) , ((lambda (e) (+ e 13)) 1) )
; = '(5, 14)

; picks second lambda func
; (cadr `(,((lambda (e) (+ e 1)) 5) , ((lambda (e) (+ e 13)) 1) ))
; = 14

;apply lambda inside lambda
;((lambda (x) (+ ((lambda (e) (* 2 e)) 4) x)) 6)
; = 14

; primo priklad z ukazky
;((lambda (x) (* ((lambda (e) (+ e 2)) x) 4)) 6)
; = 32


(define (f x) (+ x 1))
(define (g x) (* x 2))
(define (h x) (- x 3))


(define (compose-chain lst)
  (if (null? lst)
      (lambda (x) (+ x 0))
      ((car lst) (compose-chain (cdr lst)))
      )
  )