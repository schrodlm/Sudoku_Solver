# Sudoku solver

Program created in **Racket** programming language that is able to solve sudokus of any valid size.

If there is more than one solution, solver will print only one and if sudoku is unsolvable (invalid board is provided) our program is able to recognize that before it starts searching for a solution.
It is also able to determine how to work with different sized grids and what numbers & rules apply to these specific sizes.
Program is thoroughly tested and user is able to access these tests and even modify them.

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

### Prerequisites

To be able to execute Racket programs, you can use a graphical environment ([DrRacket](https://racket-lang.org/download/)). Otherwise, the racket executable will run a command-line Read-Eval-Print-Loop (REPL).


### Running the program

Clone this repository and run the sudoku-solver.rkt executable.

**Using provided test sudoku boards**

To use any of the provided boards, you can type 
`(sudoku-solver name-of-the-board)`.

All provided boards can be found in *test-boards.rkt* file. Here you can also find information about them and where they were taken from.

**Create your own board**

You can also create your own board, using template boards located in *test-board.rkt*.

Cells occupied by 0 are undefined and you can change them to any valid number. Then call `(sudoku-solver name-of-the-template-board)` function and result should be printed out.

## Running the tests

Explain how to run the automated tests for this system

### Sample Tests

Explain what these tests test and why

    Give an example


## Authors

  - **Matěj Schrödl** - *Created the program* 

  - **Billie Thompson** - *Provided README Template* -
    [PurpleBooth](https://github.com/PurpleBooth)

  

## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details

