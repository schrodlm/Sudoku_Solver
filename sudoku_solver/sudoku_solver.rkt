#lang racket


(define sudoku-ex1
  '((0 0 0 9 7 0 0 0 0) 
    (0 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 0)))

(define sudoku-ex2
  '((1 2 3 9 7 4 4 5 6)
    (0 4 0 2 5 0 1 0 7)
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 1)))
(define sudoku-ex3
  '((0 2 3 4 5 6 7 8 9) 
    (1 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 0)))

; Brute force recursion approach

#|
  1) Funkce, který vrátí vyplněný list/sudoku
        (define (solver))
        Ta zkontroluje každou buňku zda v ní je číslo nebo ne

  2) Jestli ne zkusí vložit číslo 1-9
  3) Před vložením musím zkontrolovat jestli je číslo validní na vložení
        -> funkce isValid(row,col, board, valToInstert)
         isValid bude mít 3 dílčí části
         1. Zkontrolovat řádku
         2. Zkontrolovat sloupec
         3. Zkontrolovat 3x3 grid ve kterém se nachází -> 3x3 grid bych si mohl vytvořit  z toho boardu co jsem dostal

Co bych chtěl ještě implementovat:
1) Pattern matching nějakej (define/match funkcí nebo jen match() - obojí dělá to same, jen je rozdíl v zápisu), ještě přesně nevím kde, ale abych si to vyzkoušel, protože to bude ve zkoušce
2) GUI možná, jestli zbyde čas
3) Na prosemináři říkali, že chtějí i nějaký testy, příklady testů jsou na prosemináři 25.11.2022 -> ten test by měl být v extrením rkt filu a includovat ten náš main

|#



; Checks row, column and 3x3 grid, if number is possible to insert
(define (isValid board val row col)
  (cond [(member val (list-ref board row))                              #f] ;checks if number is in row
        [(member val (map (lambda (x) (list-ref x col)) board))         #f] ;checks if number is in column
        ; doplnit 3x3 grid
        [else                                                           #t]
        )
  )

; inserts new value to the board and return that new board
 (define (insertToBoard board val row col) 
             (list-set board row
                       (list-set (list-ref board row) col val)))

(define (sudoku-solver board)
  (if (sudoku-solver-inner board 0 0)
      void
      (writeln "No solution found")
      
      )
  )

(define (sudoku-solver-inner board row col)
        ;if the cell is undefined (0)
  (cond [(= 0 (list-ref (list-ref board row) col))       (my-for-loop 1 board row col)]

        ; we are at number that was already given in the board
        [(< col 8)           (sudoku-solver-inner board row (add1 col))]
        [(< row 8)           (sudoku-solver-inner board (add1 row) 0)]
        [else (displayln "Solution2:")
                  (for ((rowline board)) (println rowline))]
                  )
            )

;THis for loops tries to put a value of 1-9 to specified cell
(define (my-for-loop i board row col )
  (cond [(= i 10)     #f]
        [(isValid board i row col)
                                    (define newBoard (insertToBoard board i row col))
                                    (cond [(< col 8)           (sudoku-solver-inner newBoard row (add1 col))]
                                          [(< row 8)           (sudoku-solver-inner newBoard (add1 row) 0)]
                                          [else (displayln "Solution1:") (for ((rowline newBoard)) (println rowline))])]
        [else     (my-for-loop (add1 i) board row col)]
        )
  )
       
              
