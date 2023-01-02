#lang racket

(require rackunit); unit testing framework
(require "sudoku_solver.rkt")
(include "test-boards.rkt")

;Invalid boards
;==============================================================================
;Number bigger than max valid number in a 9x9 board
(check-equal? (sudoku-solver invalid-number) "Invalid board provided")

;Number smaller than 0 in 9x9 board
(check-equal? (sudoku-solver invalid-negative-number) "Invalid board provided")

;Number bigger than max valid number in a 16x16 board 
(check-equal? (sudoku-solver 16x16-invalid-number) "Invalid board provided")

;One of board row has a different size
(check-equal? (sudoku-solver invalid-size) "Invalid board provided")

;8x8 sudoku - invalid board
(check-equal? (sudoku-solver invalid-size) "Invalid board provided")

;Duplicate numbers in a row
(check-equal? (sudoku-solver invalid-row) "Invalid board provided")

;Duplicate numbers in a column
(check-equal? (sudoku-solver invalid-col) "Invalid board provided")

;Duplicate numbers in 3x3 grid
(check-equal? (sudoku-solver invalid-grid-values) "Invalid board provided")

;Duplucate numbers in a 2x2 grid
(check-equal? (sudoku-solver invalid-grid-values) "Invalid board provided")


;One solutions sudokus
;==============================================================================


(check-equal? (sudoku-solver-inner extreme-sudoku 0 0)
              '((1 2 6 4 3 7 9 5 8)
                (8 9 5 6 2 1 4 7 3)
                (3 7 4 9 8 5 1 2 6)
                (4 5 7 1 9 3 8 6 2)
                (9 8 3 2 4 6 5 1 7)
                (6 1 2 5 7 8 3 9 4)
                (2 6 9 3 1 4 7 8 5)
                (5 4 8 7 6 9 2 3 1)
                (7 3 1 8 5 2 6 4 9)
))

(check-equal? (sudoku-solver-inner difficult-sudoku 0 0)
              '((5 8 1 6 7 2 4 3 9)
                (7 9 2 8 4 3 6 5 1)
                (3 6 4 5 9 1 7 8 2)
                (4 3 8 9 5 7 2 1 6)
                (2 5 6 1 8 4 9 7 3)
                (1 7 9 3 2 6 8 4 5)
                (8 4 5 2 1 9 3 6 7)
                (9 1 3 7 6 8 5 2 4)
                (6 2 7 4 3 5 1 9 8)
))

(check-equal? (sudoku-solver-inner intermediate-sudoku 0 0)
              '((1 2 3 6 7 8 9 4 5)
                (5 8 4 2 3 9 7 6 1)
                (9 6 7 1 4 5 3 2 8)
                (3 7 2 4 6 1 5 8 9)
                (6 9 1 5 8 3 2 7 4)
                (4 5 8 7 9 2 6 1 3)
                (8 3 6 9 2 4 1 5 7)
                (2 1 9 8 5 7 4 3 6)
                (7 4 5 3 1 6 8 9 2)
))

(check-equal? (sudoku-solver-inner beginner-sudoku 0 0)
              '((4 3 5 2 6 9 7 8 1)
                (6 8 2 5 7 1 4 9 3)
                (1 9 7 8 3 4 5 6 2)
                (8 2 6 1 9 5 3 4 7)
                (3 7 4 6 8 2 9 1 5)
                (9 5 1 7 4 3 6 2 8)
                (5 1 9 3 2 6 8 7 4)
                (2 4 8 9 5 7 1 3 6)
                (7 6 3 4 1 8 2 5 9)
))


;Multiple solutions sudokus
; - we will check if provided solution is a valid board - we will use (validBoard) function
;==============================================================================

(check-equal? (validBoard (sudoku-solver-inner more-than-one-solution-sudoku 0 0)) #true)

(check-equal? (validBoard (sudoku-solver-inner four-by-four-sudoku 0 0)) #true)

(check-equal? (validBoard (sudoku-solver-inner hex-by-hex-sudoku 0 0)) #true)
