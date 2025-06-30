function x_old = jacobi(A, b, k)
    n = size(A, 1);
    
    x_old = zeros(n, 1);
    x_new = zeros(n, 1);

    for i = 1:k
        for j = 1:n
            x_new(j) = (1 / A(j, j)) * ...
                       (b(j) - A(j, [1:j - 1, j + 1:n]) * ...
                       x_old([1:j - 1, j + 1:n]));
        end
        x_old = x_new;
    end
end