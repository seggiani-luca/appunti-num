load dati.mat;
m = size(dati, 1);

V = vander(dati(:, 1));
V = V(:, end:-1:1);
A = V(:, 1:7);

c = mq_qr(A, dati(:, 2));

t = linspace(0, 15, 1000);
plot(t, polyval(c(end:-1:1), t), 'b');