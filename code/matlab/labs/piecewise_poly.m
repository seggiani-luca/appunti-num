function y = piecewise_poly(x, C, z)
    n = size(z, 1);
    y = zeros(n, 1);

    for i = 1:n
        idx = find(~(z(i) > x), 1) - 1;
        if idx == 0
            idx = 1;
        end

        y(i) = polyval(C(idx, :), z(i));
    end
end