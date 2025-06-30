function [xvec, valvec] = newton(f, df, x0, tol, maxit)
    xvec = zeros(maxit + 1, 1);
    xvec(1) = x0;
    valvec(1) = f(x0);

    for i = 1:maxit
        xvec(i + 1) = xvec(i) - f(xvec(i)) / df(xvec(i));
        
        if abs(xvec(i + 1) - xvec(i)) < tol
            break;
        end
    end
end