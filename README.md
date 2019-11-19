# sudoku-pl

First practical exercice of the discipline PCS3838 - Artificial Intelligence

## Setup and Run

1. Install the [SWI-Prolog](https://www.swi-prolog.org/) environmemnt
1. Run

    ```bash
    swipl -f sudoku.pl
    ```
    
    It will open an interactive Prolog environment. If you want to use the *clpfd* implementation, run instead:
    
    ```bash
    swipl -f sudoku_clpfd.pl
    ```
    
1. Run

    ```prolog
    easy(Rows), sudoku(Rows), print_sudoku(Rows).
    ```
    
    It will show the result matrix for the `easy` problem. You can also change the problem using `medium`, `hard`, or `evil` instead of `easy`.

    
