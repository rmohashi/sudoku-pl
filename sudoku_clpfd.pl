:- use_module(library(clpfd)).

sudoku(Rows) :-
  length(Rows, 9),
  maplist(same_length(Rows), Rows),
  append(Rows, Values),
  Values ins 1..9,
  maplist(all_distinct, Rows),
  transpose(Rows, Columns),
  maplist(all_distinct, Columns),
  Rows = [R0, R1, R2, R3, R4, R5, R6, R7, R8],
  subgrid(R0, R1, R2),
  subgrid(R3, R4, R5),
  subgrid(R6, R7, R8).

subgrid([], [], []).
subgrid([X00, X01, X02 | Tail0], [X10, X11, X12 | Tail1], [X20, X21, X22 | Tail2]) :-
  all_distinct([X00, X01, X02, X10, X11, X12, X20, X21, X22]),
  subgrid(Tail0, Tail1, Tail2).

problem([[5, 3, _, _, 7, _, _, _, _],
         [6, _, _, 1, 9, 5, _, _, _],
         [_, 9, 8, _, _, _, _, 6, _],
         [8, _, _, _, 6, _, _, _, 3],
         [4, _, _, 8, _, 3, _, _, 1],
         [7, _, _, _, 2, _, _, _, 6],
         [_, 6, _, _, _, _, 2, 8, _],
         [_, _, _, 4, 1, 9, _, _, 5],
         [_, _, _, _, 8, _, _, 7, 9]]).

problem_5([[8, 3, 7, _, _, _, _, _, _],
           [_, 2, _, _, _, 8, 4, _, _],
           [_, _, 1, _, _, _, _, 8, 2],
           [5, 8, _, 7, 3, 1, 6, _, _],
           [_, 4, 2, 5, _, 6, 8, 7, _],
           [_, _, 6, 8, 2, 4, _, 9, 1],
           [6, 5, _, _, _, _, 2, _, _],
           [_, _, 8, 4, _, _, _, 5, _],
           [_, _, _, _, _, _, 1, 4, 6]]).

print_sudoku([]).
print_sudoku([Head|Tail]) :-
  format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n',Head),
  print_sudoku(Tail).
