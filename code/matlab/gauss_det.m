function d = gauss_det(A)
    function s = perm_sign(P)
        s = det(P); % ci sono modi piu' efficienti, vale l'esempio
    end

    [U, ~, ~, P] = gauss_decomp(A);
    d = prod(diag(U)) * perm_sign(P);
end