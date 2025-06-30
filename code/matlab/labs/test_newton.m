f = @(x) x.^3 + 4 * x * cos(x) - 2;
df = @(x) 3 * x.^2 + 4 * cos(x) - 4 * x * sin(x);

x0 = -1;
x1 = 2;

alpha = fzero(f, x0);

tol = 0; maxit = 1000;

xvec1 = newton(f, df, x0, tol, maxit);
xvec2 = newton(f, df, x1, tol, maxit);

err1 = abs(xvec1 - alpha) / alpha;
err2 = abs(xvec2 - alpha) / alpha;