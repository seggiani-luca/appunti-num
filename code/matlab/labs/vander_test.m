t = 2:50;
cond = zeros(49, 1);

for i = t
    x = linspace(-2, 2, i);

    V = vander(x');
    V = V(:, end:-1:1);

    cond(i - 1) = max(abs(eig(V' * V)));
end

loglog(t', cond);