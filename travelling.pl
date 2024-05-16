% Edge definitions
edge(a, b, 3). 
edge(a, c, 5). 
edge(a, d, 7). 
edge(a, e, 8).
edge(b, c, 9). 
edge(b, d, 10). 
edge(b, e, 3).
edge(c, d, 5). 
edge(c, e, 8).
edge(d, e, 6).
edge(b, a, 3). 
edge(c, a, 4). 
edge(d, a, 2). 
edge(e, a, 7).
edge(c, b, 4). 
edge(d, b, 6). 
edge(e, b, 3).
edge(d, c, 5). 
edge(e, c, 8).
edge(e, d, 6).
edge(a, h, 2). 
edge(h, d, 1).

% Find the shortest cycle starting and ending at 'Start', visiting all nodes exactly once
solve_tsp(Start, Path, MinDistance) :-
    findall(City, edge(Start, City, _), Cities),
    findall(City, edge(City, Start, _), Cities2),
    union(Cities, Cities2, UniqueCities),
    permutation(UniqueCities, PathOrder),
    append(PathOrder, [Start], FullPath),
    calculate_path_cost(Start, FullPath, 0, MinDistance),
    Path = [Start|FullPath].

% Calculate the total distance of a path
calculate_path_cost(_, [], Acc, Acc).
calculate_path_cost(Prev, [Next|Tail], Acc, Cost) :-
    edge(Prev, Next, Distance),
    NewAcc is Acc + Distance,
    calculate_path_cost(Next, Tail, NewAcc, Cost).

% Utility predicates
union([], L, L).
union([H|T], L, R) :-
    member(H, L), !, union(T, L, R).
union([H|T], L, [H|R]) :-
    union(T, L, R).

% Example query to find the shortest path starting at 'a' 
% ?- solve_tsp(a, Path, MinDistance).
