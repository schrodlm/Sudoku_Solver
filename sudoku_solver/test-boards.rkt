

;Sudoku that doesn't have any solution
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

(define invalid-number
  '((0 2 3 4 5 6 7 8 999) 
    (1 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 0)))

(define invalid-size
  '((0 2 3 4 5 6 7 8 9 0 3) 
    (1 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3)
    (0 1 2 8 0 0 6 0 0)
    (9 7 0 0 4 0 0 3 5)
    (0 0 4 0 0 2 9 1 0)
    (2 0 1 0 0 7 5 0 0)
    (4 0 9 0 8 1 0 6 0)
    (0 0 0 0 2 9 0 0 0)))


(define invalid-grid
  '((0 2 3 4 5 6 7 0) 
    (1 4 0 2 5 0 1 0) 
    (0 0 7 6 0 0 4 0)
    (0 1 2 8 0 0 6 0)
    (0 7 0 0 4 0 0 3)
    (0 0 4 0 0 2 0 1)
    (2 0 1 0 0 7 5 0)
    (4 0 0 0 8 1 0 6))


;This sudoku has about 30 possible solution - our program will print only of them.
(define more-than-one-solution-sudoku
  '((0 0 0 9 7 0 0 0 0) 
    (0 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3) 
    (0 1 2 8 0 0 6 0 0) 
    (9 7 0 0 4 0 0 3 5) 
    (0 0 4 0 0 2 9 1 0) 
    (2 0 1 0 0 7 5 0 0) 
    (4 0 9 0 8 1 0 6 0) 
    (0 0 0 0 2 9 0 0 1)))

;Beginner four-by-four sudoku
(define four-by-four-sudoku
  '((3 0 0 0) 
    (0 0 1 0) 
    (0 0 0 0)
    (4 0 0 0)
   ))

;Beginner hex-by-hex sudoku 
(define hex-by-hex-sudoku
  '((0 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 13 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 3 0 4 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    ))

;Sudokus with only one right solution - you can check these solutions here "https://sandiway.arizona.edu/sudoku/examples.html"
;------------------------------------

;Arizona Daily Wildcat: Tuesday, Jan 17th 2006
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

;Daily Telegraph January 19th "Diabolical"
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

;Vegard Hanssen puzzle 2155141
;This is puzzle number 2155141, the highest-rated puzzle (as of Jan 19th 2006) on the Top 10 list on Vegard Hanssen's webpage
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

;Challenge 1 from Sudoku Solver by Logic
; possibly not solvable by human ->  At some steps, they seem to require long chains of inference just to eliminate a single value.
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



;Template boards
;------------------------------------

(define 4x4-template
  '((0 0 0 0) 
    (0 0 0 0) 
    (0 0 0 0)
    (0 0 0 0)
   ))


(define 9x9-template
  '((0 0 0 0 0 0 0 0 0) 
    (0 0 0 0 0 0 0 0 0) 
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0)))

(define 16x16-template
  '((0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    ))