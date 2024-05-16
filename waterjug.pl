% Define the goal state
goal(2, _).

% Entry point to start solving the problem
solve :- fill(0, 0).

% Base case: when goal state is reached
fill(X, Y) :-
    goal(X, Y),
    nl, write('Goal State is Reached: ('), write(X), write(','), write(Y), write(').').

% Fill the 4-gallon jug
fill(X, Y) :-
    X < 4,
    nl, write('Fill the 4-Gallon Jug: (4,'), write(Y), write(')'),
    fill(4, Y).

% Fill the 3-gallon jug
fill(X, Y) :-
    Y < 3,
    nl, write('Fill the 3-Gallon Jug: ('), write(X), write(',3)'),
    fill(X, 3).

% Pour water from 3-gallon to 4-gallon until the 4-gallon is full
fill(X, Y) :-
    X + Y >= 4, Y > 0, X < 4,
    Y1 is Y - (4 - X),
    nl, write('Pour water from 3-Gallon Jug to 4-Gallon until full: (4,'), write(Y1), write(')'),
    fill(4, Y1).

% Pour water from 4-gallon to 3-gallon until the 3-gallon is full
fill(X, Y) :-
    X + Y >= 3, X > 0, Y < 3,
    X1 is X - (3 - Y),
    nl, write('Pour water from 4-Gallon Jug to 3-Gallon until full: ('), write(X1), write(',3)'),
    fill(X1, 3).

% Pour all water from 3-gallon to 4-gallon
fill(X, Y) :-
    X + Y < 4, X == 0, Y > 0,
    X1 is X + Y,
    nl, write('Pour all water from 3-Gallon Jug to 4-Gallon: ('), write(X1), write(',0)'),
    fill(X1, 0).

% Pour all water from 4-gallon to 3-gallon
fill(X, Y) :-
    X + Y < 3, Y == 0, X > 0,
    Y1 is X + Y,
    nl, write('Pour all water from 4-Gallon Jug to 3-Gallon: (0,'), write(Y1), write(')'),
    fill(0, Y1).

% Empty the 4-gallon jug
fill(X, Y) :-
    X == 4,
    nl, write('Empty the 4-Gallon Jug: (0,'), write(Y), write(')'),
    fill(0, Y).

% Empty the 3-gallon jug
fill(X, Y) :-
    Y == 3,
    nl, write('Empty the 3-Gallon Jug: ('), write(X), write(',0)'),
    fill(X, 0).

% Handling overflow cases
fill(X, Y) :-
    (X > 4 ; Y > 3),
    nl, write('Overflow detected.'),
    !, fail.

% Starting point
:- solve.

%example query ?- solve.

