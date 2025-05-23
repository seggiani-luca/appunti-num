function m = secant_method(f, a, b, k, tol)
    if nargin < 5
        tol = 0.01;
    end

    if nargin < 4
        k = 100;
    end

    for i = 1:k
        % print info
        fprintf("\nIteration %d\n", i);
        fprintf("\ta: %.4f\n", a);
        fprintf("\tb: %.4f\n", b);

        % update
        m = a - f(a) * ((b - a) / (f(b) - f(a)));
        a = b;
        b = m;

        % tolerance
        if abs(b - a) < tol
            break;
        end
    end
end