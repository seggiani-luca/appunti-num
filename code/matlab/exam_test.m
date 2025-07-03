f = @(x) exp(-x) - sin(x);
alpha = fzero(f, 0);

x0 = 0.1;

phi = @(x) -log(sin(x));

for i = 1:50
    x0 = phi(x0);
    disp(x0);
end