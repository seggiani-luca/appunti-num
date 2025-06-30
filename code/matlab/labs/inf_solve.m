function x = inf_solve(A, b)
    n = size(A, 1);
    x = zeros(n, 1);
    
    for i = 1:n
        c = b(i, 1) - sum(A(i, :) * x);
        x(i, 1) = c / A(i, i);
    end
end