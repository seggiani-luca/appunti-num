function [A, b] = my_gauss(A, b)
    n = size(A, 1);

    if nargin < 2
        b = zeros(n , 1);
    end

    for i = 1:n
        for j = i + 1:n
            l = A(j, i) / A(i, i);
            A(j, :) = A(j, :) - A(i, :) * l;
            b(j, :) = b(j, :) - b(i, :) * l;
        end
    end
end