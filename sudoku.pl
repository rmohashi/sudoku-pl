sudoku(Rows) :-
  length(Rows, 9),
  maplist(same_length(Rows), Rows),
  maplist(all_diff, Rows),
  transpose(Rows, Columns),
  maplist(all_diff, Columns),
  Rows = [R0, R1, R2, R3, R4, R5, R6, R7, R8],
  subgrid(R0, R1, R2),
  subgrid(R3, R4, R5),
  subgrid(R6, R7, R8),
  append(Rows, Values),
  sudoku_numbers(Values).

subgrid([], [], []).
subgrid([X00, X01, X02 | Tail0], [X10, X11, X12 | Tail1], [X20, X21, X22 | Tail2]) :-
  all_diff([X00, X01, X02, X10, X11, X12, X20, X21, X22]),
  subgrid(Tail0, Tail1, Tail2).

sudoku_numbers([]).
sudoku_numbers([Head|Tail]) :-
  between(1, 9, Head),
  sudoku_numbers(Tail).

all_diff([]).
all_diff(Values) :-
  all_diff(Values, []).

all_diff([], _).
all_diff([Head|Tail], Values) :-
  maplist(dif(Head), Values),
  all_diff(Tail, [Head|Values]).

transpose([], []).
transpose([[A0, A1, A2, A3, A4, A5, A6, A7, A8],
           [B0, B1, B2, B3, B4, B5, B6, B7, B8],
           [C0, C1, C2, C3, C4, C5, C6, C7, C8],
           [D0, D1, D2, D3, D4, D5, D6, D7, D8],
           [E0, E1, E2, E3, E4, E5, E6, E7, E8],
           [F0, F1, F2, F3, F4, F5, F6, F7, F8],
           [G0, G1, G2, G3, G4, G5, G6, G7, G8],
           [H0, H1, H2, H3, H4, H5, H6, H7, H8],
           [I0, I1, I2, I3, I4, I5, I6, I7, I8]], Columns) :-
  Columns = [[A0, B0, C0, D0, E0, F0, G0, H0, I0],
             [A1, B1, C1, D1, E1, F1, G1, H1, I1],
             [A2, B2, C2, D2, E2, F2, G2, H2, I2],
             [A3, B3, C3, D3, E3, F3, G3, H3, I3],
             [A4, B4, C4, D4, E4, F4, G4, H4, I4],
             [A5, B5, C5, D5, E5, F5, G5, H5, I5],
             [A6, B6, C6, D6, E6, F6, G6, H6, I6],
             [A7, B7, C7, D7, E7, F7, G7, H7, I7],
             [A8, B8, C8, D8, E8, F8, G8, H8, I8]].

easy([[5, 3, _, _, _, 2, 9, _, _],
      [2, 8, _, _, _, _, 1, _, 7],
      [_, _, 6, _, 3, _, 2, 5, _],
      [6, _, 9, _, 2, _, _, 1, 3],
      [_, _, _, 5, _, 6, _, _, _],
      [8, 5, _, _, 1, _, 6, _, 4],
      [_, 1, 5, _, 7, _, 8, _, _],
      [3, _, 8, _, _, _, _, 9, 5],
      [_, _, 2, 9, _, _, _, 7, 1]]).

medium([[_, _, 1, _, 8, 5, _, 2, 6],
        [_, _, 8, _, 2, 1, _, _, _],
        [_, _, _, 9, _, _, 7, _, _],
        [1, _, _, _, 5, _, 8, _, 7],
        [_, 6, _, _, 1, _, _, 9, _],
        [4, _, 2, _, 7, _, _, _, 1],
        [_, _, 4, _, _, 2, _, _, _],
        [_, _, _, 1, 9, _, 2, _, _],
        [2, 1, _, 5, 6, _, 9, _, _]]).

hard([[_, _, 9, 2, _, _, 8, _, 4],
      [1, _, 3, _, _, _, 6, _, _],
      [_, _, _, _, 3, 4, _, _, _],
      [_, _, 4, 6, _, _, 9, _, 8],
      [_, _, _, 9, _, 8, _, _, _],
      [9, _, 6, _, _, 3, 4, _, _],
      [_, _, _, 3, 8, _, _, _, _],
      [_, _, 5, _, _, _, 1, _, 6],
      [4, _, 7, _, _, 9, 3, _, _]]).

evil([[5, _, _, _, 4, _, 9, _, _],
      [9, _, _, _, _, _, _, 5, 6],
      [_, 3, 4, _, _, _, _, 2, _],
      [_, 1, _, _, 9, _, 3, _, _],
      [_, _, _, 7, _, 3, _, _, _],
      [_, _, 3, _, 5, _, _, 8, _],
      [_, 8, _, _, _, _, 2, 3, _],
      [6, 4, _, _, _, _, _, _, 7],
      [_, _, 2, _, 8, _, _, _, 4]]).

print_sudoku([]).
print_sudoku([Head|Tail]) :-
  format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n',Head),
  print_sudoku(Tail).
