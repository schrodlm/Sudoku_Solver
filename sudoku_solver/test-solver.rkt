#lang racket

(require rackunit); unit testing framework
(require "sudoku_solver.rkt")
(include "test-boards.rkt")

(check-equal? (sudoku-solver invalid-number) "Invalid board provided")


