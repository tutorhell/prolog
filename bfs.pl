s(a, b). s(a, c). s(b, d). s(b, e). s(c, f). s(c, g).
s(d, h). s(e, i). s(e, j). s(f, k).
goal(f). goal(j).

solve(Start, Solution) :-
    bfs([[Start]], Solution).

bfs([[Node|Path] | _], [Node|Path]) :-
    goal(Node).
bfs([Path | Paths], Solution) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, Paths1),
    bfs(Paths1, Solution).

extend([Node | Path], NewPaths) :-
    findall([NewNode, Node | Path],
            (s(Node, NewNode), \+ member(NewNode, [Node | Path])),
            NewPaths).

% solve(a, Solution).