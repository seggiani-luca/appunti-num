function i = trapezi_gen(f, a, b, L)
    x = linspace(a, b, L + 1);
    i = ((b - a) / (2 * L)) * (f(x(1)) + 2 * sum(f(x(2:L))) + f(x(L + 1)));
end