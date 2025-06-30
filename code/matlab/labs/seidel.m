function x = seidel(A, b, k)
    n = size(A, 1);
    
    x = zeros(n, 1);

    for i = 1:k
        for j = 1:n
            x(j) = (1 / A(j, j)) * ...
                       (b(j) - A(j, [1:j - 1, j + 1:n]) * ...
                       x([1:j - 1, j + 1:n]));
        end
    end
end