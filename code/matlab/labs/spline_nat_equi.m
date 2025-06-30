function C = spline_nat_equi(x, f)
    n = size(x, 1);
    
    A = diag([2; 4 * ones(n - 2, 1); 2]) ...
      + diag(ones(n - 1, 1), 1) ...
      + diag(ones(n - 1, 1), -1);

    b = max(x); a = min(x);
    h = (b - a) / (n - 1);

    c = zeros(n, 1);
    c(1) = f(2) - f(1);
    c(n) = f(n) - f(n - 1);
    c(2:n - 1) = f(3:n) - f(1: n - 2);
    c = (3 / h) * c;

    m = A \ c;

    C = zeros(n - 1, 4);

    for i = 1:n - 1
        % generati da matlab
        C(i, 1) = (2*f(i))/h^3 - (2*f(i+1))/h^3 + m(i+1)/h^2 + m(i)/h^2;
        C(i, 2) = f(i+1)/h^2 + f(i)/h^2 + (2*f(i+1)*x(i+1))/h^3 + (4*f(i+1)*x(i))/h^3 - (4*f(i)*x(i+1))/h^3 - (2*f(i)*x(i))/h^3 - (m(i+1)*x(i+1))/h^2 - (2*m(i+1)*x(i))/h^2 - (2*m(i)*x(i+1))/h^2 - (m(i)*x(i))/h^2;
        C(i, 3) = (2*f(i)*x(i+1)^2)/h^3 - (2*f(i)*x(i+1))/h^2 - (2*f(i+1)*x(i)^2)/h^3 - (2*f(i+1)*x(i))/h^2 + (m(i+1)*x(i)^2)/h^2 + (m(i)*x(i+1)^2)/h^2 - (4*f(i+1)*x(i+1)*x(i))/h^3 + (4*f(i)*x(i+1)*x(i))/h^3 + (2*m(i+1)*x(i+1)*x(i))/h^2 + (2*m(i)*x(i+1)*x(i))/h^2;
        C(i, 4) = (f(i+1)*x(i)^2)/h^2 + (f(i)*x(i+1)^2)/h^2 + (2*f(i+1)*x(i+1)*x(i)^2)/h^3 - (2*f(i)*x(i+1)^2*x(i))/h^3 - (m(i+1)*x(i+1)*x(i)^2)/h^2 - (m(i)*x(i+1)^2*x(i))/h^2;
    end
end