function x = fwd_subst(L, b)
    n = height(L);
    x = zeros(n, 1);

    for i = 1:n
        p = b(i);
        for j = 1:(i -1)
            p = p - L(i, j) * x(j);
        end
        x(i) = p / L(i, i);
    end
end