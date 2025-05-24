function [v, e] = close_eigen(A, s, z0, k, tol)
    if nargin < 5
        tol = 0.01;
    end

    if nargin < 4
        k = 100;
    end

    n = height(A);
    B = inv(A - eye(n) * s);

    [v, m] = max_eigen(B, z0, k, tol);
    e = 1 / m + s;
end