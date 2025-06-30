 function [V, D] = qr_eigen(A, k)
    function [V, D] = eigu(T)
        n = height(T);

        D = diag(diag(T));

        V = zeros(n);
        
        for j = 1:n
            Tu = T(1:j - 1, 1:j - 1) - T(j, j) * eye(j - 1);
            z = T(1:j - 1, j);
            Viu = - (Tu \ z);
            
            V(1:j - 1, j) = Viu;
            V(j, j) = 1;
        end
    end

    n = height(A);
    Qt = eye(n);

    for i = 1:k
        [Q, R] = qr_decomp(A);
        A = R * Q;
        Qt = Qt * Q;
    end

    % tronca al triangolo superiore
    T = triu(A);

    [V, D] = eigu(T);    
    V = Qt * V;
end