function X = gauss_solve(A, B)
    n = height(A);
    s = width(B);
    
    AB = [A, B];
    
    UB1 = gauss_decomp(AB, zeros(n, 1));
    U = UB1(:, 1:n);
    B1 = UB1(:, (n + 1):(n + s));

    X = zeros(n, s);

    for i = 1:s
        X(:, i) = bck_subst(U, B1(:, i));
    end
end