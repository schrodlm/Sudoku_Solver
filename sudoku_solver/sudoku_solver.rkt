#lang racket
(require racket/include)
(include "test-boards.rkt")


; Brute force recursion approach

#|

 Idea:

 Our program tries to insert values that follow sudoku rules:

      1. Each row must contain the numbers 1-9 exactly once
      2. Each column must contain the numbers 1-9 exactly once
      3. Each 3×3 box must contain the numbers 1-9 exactly once

These rules were specific to 9x9 sudokus, but there can be sudoku of any size that follow the rule: (n^2 x n^2 ; n <= 1) -> where n^2 is number of rows and columns

This program is able to solve sudoku of any size that follows this rules and is solvable.

After value is inserted we continue to next column and if we are at the end of the row we will move to the begging of next row. If we reach last column of the last row we can print out the solution.
If somewhere along the way we will be unable to insert value between 1-9 to a cell we will backtrack to last cell that is possible to ocuppy with another number and try that number instead (brute force).


TODOS:
    - Implement your own ref-list
    - Check if provided board is valid


|#



  
; Main Sudoku Solver function
;---------------------------------------------------------------------------------------------------------------------------------------------------------

(define (sudoku-solver board)
  (if (validBoard board)
  (let ([solvedSudoku (sudoku-solver-inner board 0 0)])
  (displayln "Solution: ") (for ((row solvedSudoku)) (println row))) ;printing out solved board
  "Invalid board provided")
  )

;Returns solved sudoku board (in a list)
(define (sudoku-solver-inner board row col)
        
  (cond [(= 0 (list-ref (list-ref board row) col))       (cell-fill 1 board row col)] ;if the cell is undefined (0)

        ; cell is not empty (number is given and cannot be changed)
        [(< col (board-size board) )           (sudoku-solver-inner board row (add1 col))] ;!
        [(< row (board-size board))           (sudoku-solver-inner board (add1 row) 0)]    ;!
        [else board]
                  )
            )


#|
 Board validity checking - this function checks at the start of the solve if the board is valid
 Invalid boards:
      1) Is invalid size
      2) Contains invalid cell values (following the rules of sudoku)
      3) Contains duplicate cell values in a row or in a column
|#
;---------------------------------------------------------------------------------------------------------------------------------------------------------

(define (validBoard board)
  (define size (length board))


  (cond  [(not(list? board))                                                         #f] ;check if provided board is a list
         [(not(integer? (sqrt size)))                                                #f] ;check if board is valid size
         [(checkDuplicateNumbers board 0 (length board))                             #f]
         [(checkGrid board (length board) (sqrt(length board)) 0 0)                  #f]
         [else                                                    (checkRow board size)]))

(define (checkRow board size)
  (cond [(null? board)                                                                                #t]
        [(not(equal? (length (car board)) size))                                                      #f]
        [(not(andmap (lambda (x) (and (<= x size) (>= x 0))) (car board)))                            #f]
        [else                                                                (checkRow (cdr board) size)]
          )
      )


(define (checkDuplicateNumbers board num size)
  (cond [(= num size)                                                                                     #f]
        [(check-duplicates (filter (lambda (x) (not(= x 0))) (list-ref board num)))                       #t]
        [(check-duplicates (filter (lambda (x) (not(= x 0))) (map (lambda (x) (list-ref x num)) board)))  #t]
        [else                                                  (checkDuplicateNumbers board (add1 num) size)])
  )

(define (checkGrid board size grid-size row col)
  (cond [(check-duplicates (get-grid board row col))                    #t]
        [(< col size)          (checkGrid board size grid-size row (+ col grid-size))]
        [(< row size)          (checkGrid board size grid-size (+ row grid-size) 0)]
        [else #f])
  )
        


; Cell filling - tries to put a value of 1-9 to specified cell
;---------------------------------------------------------------------------------------------------------------------------------------------------------

(define (cell-fill i board row col)
  (cond [(= i (add1 (length board)))     #f]               
        [(isValid board i row col)
                                    (define newBoard (insertToBoard board i row col)) ;creates a new board with value inserted
                                    (cond [(< col (board-size newBoard))           (let ([sol (sudoku-solver-inner newBoard row (add1 col))]) (if sol sol (cell-fill (add1 i) board row col)))] ;!
                                          [(< row (board-size newBoard))           (let ([sol (sudoku-solver-inner newBoard (add1 row) 0)]) (if sol sol (cell-fill (add1 i) board row col)))]   ;!
                                          [else newBoard])]
        [else     (cell-fill (add1 i) board row col)]
        )
  )

; Inserts new value to the board
;---------------------------------------------------------------------------------------------------------------------------------------------------------
 (define (insertToBoard board val row col) 
             (list-set board row
                       (list-set (list-ref board row) col val))
   )


; Checks row, column and 3x3 grid, if number is possible to insert
;---------------------------------------------------------------------------------------------------------------------------------------------------------
(define (isValid board val row col)
  (cond [(member val (list-ref board row))                              #f] ;checks if number is in row
        [(member val (map (lambda (x) (list-ref x col)) board))         #f] ;checks if number is in column
        [(member val (get-grid board row col))                          #f] ;checks if number is in specified grid
        [else                                                           #t] ;check is complete and value is valid
        )
  )


; Getting 3x3 grid
;---------------------------------------------------------------------------------------------------------------------------------------------------------


; Return list containing all numbers in 3x3 grid specified by x and y positions and filters out undefined values -> (0)

(define (get-grid board pos-y pos-x)
  (get-grid-inner board (floor(/ pos-x (grid-size board))) (floor (/ pos-y (grid-size board))) 0 (grid-size board))
   )



; Check each row and decide if it is a part of 3x3 grid specified by [x,y] position - its inner function get-grid-x then checks specified rows for the right column

; board     - full 9x9 (can be any other allowed grid) board of values where 0 is undefined value
; grid-x    - we should consider cols starting from pos/3 = grid-x
; grid-y    - we should consider rows starting from pos/3 = grid-y
; row       - current row
; grid-size - size of the grid

(define (get-grid-inner board grid-x grid-y row grid-size)
  (cond    [ (null? board)                null]
           [ (= (floor(/ row grid-size)) grid-y) (append (get-grid-x (car board) grid-x 0 grid-size) (get-grid-inner (cdr board) grid-x grid-y (+ row 1) grid-size))]
           [ #t                          (get-grid-inner (cdr board) grid-x grid-y (+ row 1) grid-size)]
           )
  )

; This is the part of getting 3x3 grid that checks row for specific columns, filters out undefined values (0) and returns values part of [x,y] specified position
; -> Inner function of get-grid-inner

; row       - list of values in that row
; grid-x    - first x pos in the list that we should consider (explanation for 9x9 boards ->  if grid-x = 3 and row = [1,2,3,4,5,6,7,8,9] - we should consider numbers starting from pos/3 = 3 ([7,8,9])
; col       - current pos in the list
; grid-size - size of the grid
  (define (get-grid-x row grid-x col grid-size)
  (cond [(null? row)                          null]
        [(= (car row) 0)                      (get-grid-x (cdr row) grid-x (+ col 1) grid-size)]
        [(= (floor(/ col grid-size)) grid-x)          (cons (car row) (get-grid-x (cdr row) grid-x (+ col 1) grid-size))]
        [ #t                                  (get-grid-x (cdr row) grid-x (+ col 1) grid-size)]
        )
    )

;Sizes
;---------------------------------------------------------------------------------------------------------------------------------------------------------

(define (board-size board)
  (sub1 (length board))
  )

(define (grid-size board)
  (sqrt (length board))
  )
      
;Provides
;---------------------------------------------------------------------------------------------------------------------------------------------------------
(provide sudoku-solver)
(provide sudoku-solver-inner)
(provide validBoard)

