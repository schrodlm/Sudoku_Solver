#lang racket

(define (intervals lst)
  (intervals-inner lst null)
  )

;princip tohodle je se udrzovat dva listy, jeden normalne pujde dolu k null a ten druhy do něj se budou přidávat prvky, které už jsme prošli
;protože i ty musíme zkontrolovat, například '((O 1) (3 4) (1 3) (6 10)) -> a jsme na prvku (3 4), nestačí nám zkontrolovat (1 3) a (6 10), musíme i (0 1) -> ten je uložen v listu 2

;check funkce pak zkontroluje jednotlivé listy kolik je tam průniků a a pak se tyto výsledky sečtou a přidají do listu

(define (intervals-inner lst1 lst2)
  (if (null? lst1)
      null
      (cons (+ (check (car(car lst1)) (cadr (car lst1)) (cdr lst1) 0) (check (car(car lst1)) (cadr (car lst1)) lst2 0)) (intervals-inner (cdr lst1) (cons (car lst1) lst2)))  
      ) 
  )



(define (check low high lst sum)
  (if (null? lst)
      sum
      (cond
        [(= low (car(car lst))) (check low high (cdr lst) (+ 1 sum))]
        [(and (< low (car(car lst))) (>= high (car(car lst)))) (check low high (cdr lst) (+ 1 sum))]
        [(and (> low (car(car lst))) (>= (cadr(car lst)) low)) (check low high (cdr lst) (+ 1 sum))]
        [#t (check low high (cdr lst) sum)]
      )
      )
  )