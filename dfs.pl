% Define edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(e, i).
edge(e, j).
edge(f, k).

% Define goal nodes
goal(f).
goal(j).

% Attempt to solve starting from a given node
solve(Start, Solution) :-
    dfs([], Start, Solution).

% DFS definition where Path keeps track of visited nodes
dfs(Path, Node, [Node|Path]) :-  % Base case: Node is a goal
    goal(Node).
dfs(Path, Node, Sol) :-          % Recursive case: continue searching
    edge(Node, Next),            % Check for an edge from Node to Next
    \+ member(Next, Path),       % Ensure Next has not been visited
    dfs([Node|Path], Next, Sol). % Recur with Next, adding Node to Path


% solve(a, Solution).