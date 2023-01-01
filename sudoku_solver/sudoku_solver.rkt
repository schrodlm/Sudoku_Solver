#lang racket

(define empty-sudoku
  '((0 0 0 0 0 0 0 0 0) 
    (0 0 0 0 0 0 0 0 0) 
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)))

(define unsolvable
  '((0 2 3 4 5 6 7 8 9) 
    (1 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 0)))

(define beginner-sudoku
  '((0 0 0 2 6 0 7 0 1) 
    (6 8 0 0 7 0 0 9 0) 
    (1 9 0 0 0 4 5 0 0)
    (8 2 0 1 0 0 0 4 0)
    (0 0 4 6 0 2 9 0 0)
    (0 5 0 0 0 3 0 2 8)
    (0 0 9 3 0 0 0 7 4)
    (0 4 0 0 5 0 0 3 6)
    (7 0 3 0 1 8 0 0 0)))


(define intermediate-sudoku
  '((0 2 0 6 0 8 0 0 0) 
    (5 8 0 0 0 9 7 0 0) 
    (0 0 0 0 4 0 0 0 0)
    (3 7 0 0 0 0 5 0 0)
    (6 0 0 0 0 0 0 0 4)
    (0 0 8 0 0 0 0 1 3)
    (0 0 0 0 2 0 0 0 0)
    (0 0 9 8 0 0 0 3 6)
    (0 0 0 3 0 6 0 9 0)))

(define difficult-sudoku
  '((0 0 0 6 0 0 4 0 0) 
    (7 0 0 0 0 3 6 0 0) 
    (0 0 0 0 9 1 0 8 0)
    (0 0 0 0 0 0 0 0 0)
    (0 5 0 1 8 0 0 0 3)
    (0 0 0 3 0 6 0 4 5)
    (0 4 0 2 0 0 0 6 0)
    (9 0 3 0 0 0 0 0 0)
    (0 2 0 0 0 0 1 0 0)))

(define extreme-sudoku
  '((0 2 0 0 0 0 0 0 0) 
    (0 0 0 6 0 0 0 0 3) 
    (0 7 4 0 8 0 0 0 0)
    (0 0 0 0 0 3 0 0 2)
    (0 8 0 0 4 0 0 1 0)
    (6 0 0 5 0 0 0 0 0)
    (0 0 0 0 1 0 7 8 0)
    (5 0 0 0 0 9 0 0 0)
    (0 0 0 0 0 0 0 4 0)))

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
        [(member val (get-grid board row col))                          #f] ;checks if number is in specified grid
        [else                                                           #t]
        )
  )

; inserts new value to the board and return that new board
 (define (insertToBoard board val row col) 
             (list-set board row
                       (list-set (list-ref board row) col val)))

(define (sudoku-solver board)
  (if (sudoku-solver-inner board 0 0)
      (void)
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

;This for loop tries to put a value of 1-9 to specified cell
(define (my-for-loop i board row col)
  (cond [(= i 10)     #f]
        [(isValid board i row col)
                                    (define newBoard (insertToBoard board i row col))
                                    (cond [(< col 8)           (if (sudoku-solver-inner newBoard row (add1 col)) #t (my-for-loop (add1 i) board row col))]
                                          [(< row 8)           (if (sudoku-solver-inner newBoard (add1 row) 0) #t (my-for-loop (add1 i) board row col))]
                                          [else (displayln "Solution: ") (for ((row newBoard)) (println row))])]
        [else     (my-for-loop (add1 i) board row col)]
        )
  )

; Implement your own ref-list
; Udělat README.md
; Checknout jestli board, kterou dostanu je valid -> nenachází se zde žádná nevalidní buňka, splňuje povolené velikosti (n^2 x n^2 ; n <= 1)

              


; Getting 3x3 grid
;=========================================================================================================================


; Return list containing all numbers in 3x3 grid specified by x and y positions and filters out undefined values -> (0)

(define (get-grid board pos-y pos-x)
  (get-grid-inner board (floor(/ pos-x 3)) (floor (/ pos-y 3)) 0)
   )



; Check each row and decide if it is a part of 3x3 grid specified by [x,y] position - its inner function get-grid-x then checks specified rows for the right column

; board   - full 9x9 (can be any other allowed grid) board of values where 0 is undefined value
; grid-x  -   we should consider cols starting from pos/3 = grid-x
; grid-y  -   we should consider rows starting from pos/3 = grid-y
; row     -   current row

(define (get-grid-inner board grid-x grid-y row)
  (cond    [ (null? board)                null]
           [ (= (floor(/ row 3)) grid-y) (append (get-grid-x (car board) grid-x 0) (get-grid-inner (cdr board) grid-x grid-y (+ row 1)))]
           [ #t                          (get-grid-inner (cdr board) grid-x grid-y (+ row 1))]
           )
  )

; This is the part of getting 3x3 grid that checks row for specific columns, filters out undefined values (0) and returns values part of [x,y] specified position
; -> Inner function of get-grid-inner

; row     - list of values in that row
; grid-x  - first x pos in the list that we should consider ( if grid-x = 3 and row = [1,2,3,4,5,6,7,8,9] - we should consider numbers starting from pos/3 = 3 ([7,8,9])
; col     - current pos in the list
  (define (get-grid-x row grid-x col)
  (cond [(null? row)                          null]
        [(= (car row) 0)                      (get-grid-x (cdr row) grid-x (+ col 1))]
        [(= (floor(/ col 3)) grid-x)          (cons (car row) (get-grid-x (cdr row) grid-x (+ col 1)))]
        [ #t                                  (get-grid-x (cdr row) grid-x (+ col 1))]
        )
    )

;=========================================================================================================================



