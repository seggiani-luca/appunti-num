f = @(x) log(2 + x);
bl = -1; bu = 1;
k = 4;

x = linspace(bl, bu, k + 1);
y = f(x);

t = linspace(bl, bu, 100);

w = valuta_lagrange(x', y', t');

plot(t, w - f(t)');