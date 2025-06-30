f = @(x) x - x.^(1/3) - 2;
x0 = 3;

alpha = fzero(f, x0);

phi1 = @(x) x.^(1/3) + 2;
phi2 = @(x) (x - 2).^3;
phi3 = @(x)  (6 + 2 * x.^(1 / 3)) / (3 - x.^(-2 / 3));

tol = 0; maxit = 1000;

xvec1 = puntofisso(phi1, x0,tol, maxit);
xvec2 = puntofisso(phi2, x0,tol, maxit);
xvec3 = puntofisso(phi3, x0,tol, maxit);

err1 = abs(xvec1 - alpha) / alpha;
err2 = abs(xvec2 - alpha) / alpha;
err3 = abs(xvec3 - alpha) / alpha;