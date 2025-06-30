function w = valuta_lagrange(x, y, v)
    n = size(v, 1);
    p = size(x, 1);

    w = zeros(n, 1);

    for i = 1:n % valutazioni
        for j = 1:p % basi
            num = prod(v(i) - x([1:j - 1, j + 1:p]));
            den = prod(x(j) - x([1:j - 1, j + 1:p]));
            b = num / den;

            w(i) = w(i) + b * y(j);
        end
    end
end