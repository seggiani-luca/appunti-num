function [A, b, L] = gauss_decomp(A, b)
    n = height(A);

    L = eye(n); % prepara L

    for i = 1:n % i itera sulle diagonali
        % qui fai il pivot
        h = find(A(i:n, i) == max(A(i:n, i))) + i - 1;

        A([i, h], :) = A([h, i], :); % permuta A
        b([i, h]) = b([h, i]); % permuta b
        
        den = A(i, i);

        for j = (i + 1):n % j itera sulle righe
            mul = A(j, i) / den; % moltiplicatore
            L(j, i) = mul;
            
            A(j, :) = A(j, :) - A(i, :) * mul;
            b(j) = b(j) - b(i) * mul; # qui c'è un errore diffuso usavi +
        end
    end
end