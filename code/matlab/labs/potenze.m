function [z0, lamvec] = potenze(A, z0, maxit)
    lamvec = zeros(maxit, 1);

    for i = 1:maxit
       y = A * z0;
       lamvec(i) = z0' * y;
       z0 = y / norm(y);
    end
end