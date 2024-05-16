% Define initial and goal states
test(Plan) :-
    Init = [at(tile4, 1), at(tile3, 2), at(tile8, 3), at(empty, 4), at(tile2, 5), at(tile6, 6), at(tile5, 7), at(tile1, 8), at(tile7, 9)],
    Goal = [at(tile1, 1), at(tile2, 2), at(tile3, 3), at(tile4, 4), at(empty, 5), at(tile5, 6), at(tile6, 7), at(tile7, 8), at(tile8, 9)],
    nl, write('Initial state:'), nl,
    write_sol(Init),
    nl, write('Goal state:'), nl,
    write_sol(Goal),
    nl,
    solve(Init, Goal, Plan).

% Recursive solver
solve(State, Goal, Plan) :-
    solve(State, Goal, [], Plan).

% Base case: when the current state is a subset of the goal state
solve(State, Goal, Sofar, Sofar) :-
    is_subset(Goal, State),
    nl, 
    write('Solution:'), nl,
    write_sol(Sofar).

% Recursive case: try an action and proceed
solve(State, Goal, Sofar, Plan) :-
    act(Action, Preconditions, Delete, Add),
    is_subset(Preconditions, State),
    \+ member(Action, Sofar),
    delete_list(Delete, State, Remainder),
    append(Add, Remainder, NewState),
    solve(NewState, Goal, [Action | Sofar], Plan).

% Define actions and their effects
act(move(X, Y, Z), [at(X, Y), at(empty, Z), is_movable(Y, Z)], [at(X, Y), at(empty, Z)], [at(X, Z), at(empty, Y)]).

% Check if a tile is movable to the empty spot
is_movable(X, Y) :- 
    Diff is X - Y, 
    (Diff = 1; Diff = -1; Diff = 3; Diff = -3).

% List and set utilities
is_subset([], _).
is_subset([H | T], Set) :-
    member(H, Set),
    is_subset(T, Set).

delete_list([], Curstate, Curstate).
delete_list([H | T], Curstate, Newstate) :-
    remove(H, Curstate, Remainder),
    delete_list(T, Remainder, Newstate).

remove(X, [X | T], T).
remove(X, [H | T], [H | R]) :-
    remove(X, T, R).

write_sol([]).
write_sol([H | T]) :-
    write_sol(T),
    write(H), nl.

append([], L, L).
append([H | T], L1, [H | L2]) :-
    append(T, L1, L2).

member(X, [X | _]).
member(X, [_ | T]) :-
    member(X, T).



% test(Plan).