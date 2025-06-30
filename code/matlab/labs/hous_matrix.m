function Hv = hous_matrix(x)
    n = size(x, 1);

    if x(1) > 0
        x(1) = x(1) + norm(x);
    else
        x(1) = x(1) - norm(x);
    end

    Hv = eye(n) - 2 * (x * x') / (norm(x)^2);
end