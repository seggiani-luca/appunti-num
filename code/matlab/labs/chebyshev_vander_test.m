t = 2:50;
cond = zeros(49, 1);

for i = t
    x = chebspace(-2, 2, i);

    V = vander(x');
    V = V(:, end:-1:1);

    cond(i - 1) = max(abs(eig(V' * V)));
end

loglog(t', cond);

function s = chebspace(a, b, n)
    k = 0:n-1;
    s = cos(pi * (k + 1 / 2) / n);
end