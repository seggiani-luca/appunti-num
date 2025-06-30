load dati.mat;
m = size(dati, 1);

g0 = @(x) exp(x);
g1 = @(x) 1 ./ x;
g2 = @(x) sin(x);

A = zeros(m, 3);
A(:, 1) = g0(dati(:, 1));
A(:, 2) = g1(dati(:, 1));
A(:, 3) = g2(dati(:, 1));

c = mq_qr(A, dati(:, 2));

t = linspace(1, 15, 1000);
plot(t, [g0(t'), g1(t'), g2(t')] * c, 'b');