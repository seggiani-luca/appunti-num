function A_inv = gauss_inv(A)
    n = height(A);
    A_inv = gauss_solve(A, eye(n));
end