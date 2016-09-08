# MinesweeperSolver

A Haskell Minesweeper solver.

## Input file format

Inputs are text files. The first line tells the width *w* and height *h* of the game board. The next *h* lines tell the contents of each cell, separated by spaces. Examples can be found in the [`tests`](./tests/) directory. Below is the content of the file [`tests/test0.mines`](./tests/test0.mines):

```
5 5
* 1 _ 2 *
2 2 1 2 *
1 * 2 2 2
_ _ 1 * 1
```

Mines are denoted with asterisks `*`, and number cells are denoted with their appropriate numbers.
