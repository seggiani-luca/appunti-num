f = @(x) 1 ./ (1 + x.^2);
bl = -5; bu = 5;

err = zeros(10, 1);

for n = 10:10:100
    x = linspace(bl, bu, n);
    y = f(x);
    
    C = spline_nat_equi(x', y');
    
    t = linspace(bl, bu, 1000);
    e = piecewise_poly(x', C, t') - f(t)';
    err(n / 10) = max(e);
end