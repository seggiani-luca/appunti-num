function [z0, e] = max_eigen(A, z0, k, tol)
    if nargin < 4
        tol = 0.01;
    end

    if nargin < 3
        k = 100;
    end

    % eigenvector thru power metod
    for i = 1:k
        z1 = A * z0;
        z1 = z1 / norm(z1);
    
        if norm(z1 - z0) < tol
            break;
        end

        z0 = z1;
    end

    % eigenvalue
    e = norm(A * z0);
end