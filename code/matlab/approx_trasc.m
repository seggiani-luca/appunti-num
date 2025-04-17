function c = approx_trasc(f, l, u, n)
    % le funzioni in base
    funcs = {
      @(x) exp(x);
      @(x) 1/x;
      @(x) sin(x)
    };

    % costruisce la matrice G
    function G = build_G(X)
        m = height(funcs);
        
        G = zeros(n, m);
    
        for i = 1:n
            for j = 1:m
                G(i, j) = funcs{j}(X(:, i));
            end
        end
    end

    % campiona f
    X = linspace(l, u, n);
    Y = f(X);

    % costruisci G
    G = build_G(X);

    % usa il risolutore ai quadrati minimi
    c = least_squares(G, Y');
end