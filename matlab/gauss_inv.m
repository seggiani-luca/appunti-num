function A_inv = gauss_inv(A)
    n = height(A);
    
    AI = [A, eye(n)];
    
    UB = gauss_decomp(AI, zeros(n, 1));
    U = UB(:, 1:n);
    B = UB(:, (n + 1):(2 * n));

    A_inv = zeros(n, n);

    for i = 1:n
        A_inv(:, i) = bck_subst(U, B(:, i));
    end
end