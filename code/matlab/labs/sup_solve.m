function x = sup_solve(A, b)
    n = size(A, 1);
    x = zeros(n, 1);
    
    for j = 1:n
        i = n + 1 - j;
        c = b(i, 1) - sum(A(i, :) * x);
        x(i, 1) = c / A(i, i);
    end
end