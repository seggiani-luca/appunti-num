function [z0, lamvec] = potenze_inverse(A, z0, maxit)
    lamvec = zeros(maxit, 1);

    for i = 1:maxit
       y = A \ z0;
       lamvec(i) = 1 / (z0' * y);
       z0 = y / norm(y);
    end
end