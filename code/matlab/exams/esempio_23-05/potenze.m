function [y, lamvec] = potenze(A, z, maxit)
    z0 = z / norm(z);

    lamvec = zeros(maxit, 1);

    for i = 1:maxit
        w = A * z0;
        lamvec(i) = z0' * w;
        z0 = w / norm(w);
    end

    y = w;
end