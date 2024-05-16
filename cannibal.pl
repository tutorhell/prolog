% Initial and goal states
start([3, 3, left, 0, 0]).
goal([0, 0, right, 3, 3]).

% Check if the state is legal
legal(CL, ML, CR, MR) :-
    ML >= 0, CL >= 0, MR >= 0, CR >= 0,
    (ML >= CL ; ML = 0),
    (MR >= CR ; MR = 0).

% Possible moves
move([CL, ML, left, CR, MR], [CL, ML2, right, CR, MR2]) :-
    MR2 is MR + 2, ML2 is ML - 2, legal(CL, ML2, CR, MR2).
move([CL, ML, left, CR, MR], [CL2, ML, right, CR2, MR]) :-
    CR2 is CR + 2, CL2 is CL - 2, legal(CL2, ML, CR2, MR).
move([CL, ML, left, CR, MR], [CL2, ML2, right, CR2, MR2]) :-
    CR2 is CR + 1, CL2 is CL - 1, MR2 is MR + 1, ML2 is ML - 1, legal(CL2, ML2, CR2, MR2).
move([CL, ML, left, CR, MR], [CL, ML2, right, CR, MR2]) :-
    MR2 is MR + 1, ML2 is ML - 1, legal(CL, ML2, CR, MR2).
move([CL, ML, left, CR, MR], [CL2, ML, right, CR2, MR]) :-
    CR2 is CR + 1, CL2 is CL - 1, legal(CL2, ML, CR2, MR).

move([CL, ML, right, CR, MR], [CL, ML2, left, CR, MR2]) :-
    MR2 is MR - 2, ML2 is ML + 2, legal(CL, ML2, CR, MR2).
move([CL, ML, right, CR, MR], [CL2, ML, left, CR2, MR]) :-
    CR2 is CR - 2, CL2 is CL + 2, legal(CL2, ML, CR2, MR).
move([CL, ML, right, CR, MR], [CL2, ML2, left, CR2, MR2]) :-
    CR2 is CR - 1, CL2 is CL + 1, MR2 is MR - 1, ML2 is ML + 1, legal(CL2, ML2, CR2, MR2).
move([CL, ML, right, CR, MR], [CL, ML2, left, CR, MR2]) :-
    MR2 is MR - 1, ML2 is ML + 1, legal(CL, ML2, CR, MR2).
move([CL, ML, right, CR, MR], [CL2, ML, left, CR2, MR]) :-
    CR2 is CR - 1, CL2 is CL + 1, legal(CL2, ML, CR2, MR).

% Recursive path finding
path(State, State, _, Moves) :- output(Moves).
path(Current, Goal, Visited, Moves) :-
    move(Current, Next),
    \+ member(Next, Visited),
    path(Next, Goal, [Next | Visited], [[[Next, Current] | Moves]]).

% Output the moves
output([]) :- nl.
output([[[A, B] | Moves]]) :-
    output(Moves),
    write(B), write(' -> '), write(A), nl.

% Find the solution
find :-
    start(Start), goal(Goal),
    path(Start, Goal, [Start], []).


%sample query ?- find.
