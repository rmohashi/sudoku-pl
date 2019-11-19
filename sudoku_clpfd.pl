/*
Implementação do algoritmo de resolução do Sudoku (Modificado)

Carregar no swi-prolog e rodar da seguinte maneira:

?- easy(Rows), sudoku(Rows), print_sudoku(Rows)

Onde 'easy' pode ser trocado por 'medium', 'hard' e 'evil',
de acordo com o problema a ser executado.
*/

:- use_module(library(clpfd)).

sudoku(Rows) :-
  /* Verifica se Rows é 9x9 */
  length(Rows, 9),
  maplist(same_length(Rows), Rows),
  /* Restringe os Valores de cada linha
     para serem entre 1 e 9 */
  append(Rows, Values),
  Values ins 1..9,
  /* Restringe os Valores de cada linha
     para serem todos diferentes */
  maplist(all_distinct, Rows),
  /* Transpõe a matriz de forma a realizar
     o mesmo processo feito para as linhas */
  transpose(Rows, Columns),
  maplist(all_distinct, Columns),
  /* Realiza as restrições para os blocos 3x3 */
  Rows = [R0, R1, R2, R3, R4, R5, R6, R7, R8],
  subgrid(R0, R1, R2),
  subgrid(R3, R4, R5),
  subgrid(R6, R7, R8).

subgrid([], [], []).
subgrid([X00, X01, X02 | Tail0], [X10, X11, X12 | Tail1], [X20, X21, X22 | Tail2]) :-
  /* Toma-se os 3 primeiros elementos de cada linha, de forma
     a formar um bloco 3x3. Após isso, são passados os restos
     das listas, para a restrição do próximo bloco */
  all_distinct([X00, X01, X02, X10, X11, X12, X20, X21, X22]),
  subgrid(Tail0, Tail1, Tail2).

/* Exercício de nível easy */
easy([[5, 3, _, _, _, 2, 9, _, _],
      [2, 8, _, _, _, _, 1, _, 7],
      [_, _, 6, _, 3, _, 2, 5, _],
      [6, _, 9, _, 2, _, _, 1, 3],
      [_, _, _, 5, _, 6, _, _, _],
      [8, 5, _, _, 1, _, 6, _, 4],
      [_, 1, 5, _, 7, _, 8, _, _],
      [3, _, 8, _, _, _, _, 9, 5],
      [_, _, 2, 9, _, _, _, 7, 1]]).

/* Exercício de nível medium */
medium([[_, _, 1, _, 8, 5, _, 2, 6],
        [_, _, 8, _, 2, 1, _, _, _],
        [_, _, _, 9, _, _, 7, _, _],
        [1, _, _, _, 5, _, 8, _, 7],
        [_, 6, _, _, 1, _, _, 9, _],
        [4, _, 2, _, 7, _, _, _, 1],
        [_, _, 4, _, _, 2, _, _, _],
        [_, _, _, 1, 9, _, 2, _, _],
        [2, 1, _, 5, 6, _, 9, _, _]]).

/* Exercício de nível hard */
hard([[_, _, 9, 2, _, _, 8, _, 4],
      [1, _, 3, _, _, _, 6, _, _],
      [_, _, _, _, 3, 4, _, _, _],
      [_, _, 4, 6, _, _, 9, _, 8],
      [_, _, _, 9, _, 8, _, _, _],
      [9, _, 6, _, _, 3, 4, _, _],
      [_, _, _, 3, 8, _, _, _, _],
      [_, _, 5, _, _, _, 1, _, 6],
      [4, _, 7, _, _, 9, 3, _, _]]).

/* Exercício de nível evil */
evil([[7, 4, _, _, _, _, _, _, _],
      [6, _, _, _, _, 7, _, _, _],
      [_, 3, _, 2, 8, 6, _, _, _],
      [_, 1, _, _, 6, _, 4, _, _],
      [2, _, _, _, 7, _, _, _, 3],
      [_, _, 8, _, 9, _, _, 5, _],
      [_, _, _, 8, 4, 5, _, 9, _],
      [_, _, _, 6, _, _, _, _, 7],
      [_, _, _, _, _, _, _, 1, 5]]).

print_sudoku([]).
print_sudoku([Head|Tail]) :-
  /* Imprime os valores da matriz, de forma que
     cada lista fique em uma linha diferente */
  format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n',Head),
  print_sudoku(Tail).
