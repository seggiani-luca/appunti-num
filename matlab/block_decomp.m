function p = block_decomp(A)
    G = digraph(A);
    G.Edges.Weight = ones(height(G.Edges), 1); % imposta distanze unitarie
    
    full = 1:height(A); % imposta per ottenere i non raggiungibili

    reach_table = table([], {}, {}, ...
        'VariableNames', {'Node', 'Reachable', 'Not reachable'});

    for i = 1:height(A)
        reach = [nearest(G, i, Inf)', i]; % prendi i raggiungibili + i
        reach = sort(unique(reach)); % potresti prendere i piu' volte

        non_reach = setdiff(full, reach);

        reach_row = table(i, {reach}, {non_reach}, ...
            'VariableNames', {'Node', 'Reachable', 'Not reachable'});
        reach_table = [reach_table; reach_row];
    end

    disp(reach_table);
    i = input("   Choose an index: ");
    
    P = reach_table{i, 2}{:};
    Q = reach_table{i, 3}{:};

    p = [Q, P];
end