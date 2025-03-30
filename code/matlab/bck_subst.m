function x = bck_subst(U, b)
    n = height(U);
    x = zeros(n, 1);

    for i = n:-1:1
        p = b(i);
        for j = (i + 1):n
            p = p - U(i, j) * x(j);
        end
        x(i) = p / U(i, i);
    end
end