% genero A e z
A = randn(100) + i * randn(100);
z = randn(100, 1) + i * randn(100, 1);

% trova l'approssimazione del lambda dominante
[y, lamvec] = potenze(A, z, 100);

% trova il vero lambda dominante
lam = eig(A);
[~, ind] = max(abs(lam));
maxeig = lam(ind);

% trova l'errore
err = abs((lamvec - maxeig) / maxeig);

% stampa
semilogy([1:length(err)], err, '-b');