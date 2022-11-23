#lang racket

#|
Partition

Napište funkci partition-by, která má jako parametr seznam s a unární predikát f (funkce jednoho parametru vracející #t nebo #f).
Funkce partition-by vrátí seznam délky dva. První prvek tohoto seznamu bude seznam prvků, které splňují predikát f.
Druhý prvek tohoto seznamu bude seznam prvků, které nesplňují predikát f. Relativní pořadí jednotlivých prvků bude nezměněné.
|#
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