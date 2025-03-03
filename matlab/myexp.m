function acc = myexp(x, n)
    neg = false;
    if x < 0
        neg = true;
        x = -x;
    end

    term = 1;
    acc = 1;

    for i = 1:n
        term = term * x / i;
        acc = acc + term;
    end

    if neg
        acc = 1 / acc;
    end
end