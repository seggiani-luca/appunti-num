f = @(x) 1 ./ (1 + x.^2);
bl = -5; bu = 5;

t = linspace(bl, bu, 1000);

x = chebspace(bl, bu, i);
y = f(x);
w = valuta_lagrange(x', y', t');

function s = chebspace(a, b, n)
    k = 0:n - 1;
    s = (a + b) / 2 + ((b - a) / 2) * cos(pi * (k + 1 / 2) / n);
end