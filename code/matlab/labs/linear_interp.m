function C = linear_interp(x, f)
    n = size(x, 1);

    C = zeros(n - 1, 2);

    for i = 1:n - 1
        C(i, 1) = (f(i + 1) - f(i)) / (x(i + 1) - x(i));
        C(i, 2)= f(i) - x(i) * (f(i + 1) - f(i)) / (x(i + 1) - x(i));
    end
end