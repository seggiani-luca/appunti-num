function X = sys_solve(A, B)
    [U, C] = my_gauss(A, B);
    
    n = size(A, 1);
    q = size(B, 2);
    X = zeros(n, q);

    for i = 1:q
        X(:, i) = sup_solve(U, C(:, i));
    end
end