function xvec = puntofisso(phi, x0, tol, maxit)
    xvec = zeros(maxit + 1, 1);
    xvec(1) = x0;

    for i = 1:maxit
        xvec(i + 1) = phi(x0);
        
        if abs(xvec(i + 1) - xvec(i)) < tol
            break;
        end
    end
end