function x_old = seidel(A, b, k, x)
    n = height(A);

    if nargin < 4
        % stima iniziale
        x_old = zeros(n, 1);
    end

    % imposta le matrici D E F
    DE = triu(A);
    F = -A + DE;

    % imposta c
    c = bck_subst(DE, b);

    for j = 1:k
        x_old = bck_subst(DE, F * x_old) + c;
        x_new = x_old;

        % stampa informazioni
        fprintf("it = %d, res = %.3f\n", j, norm(b - A * x_old));
        disp(x_old);
    end
end