f = @(x) 1 ./ (1 + x.^2);
bl = -5; bu = 5;

t = linspace(bl, bu, 1000);

x = linspace(bl, bu, i);
y = f(x);
w = valuta_lagrange(x', y', t');