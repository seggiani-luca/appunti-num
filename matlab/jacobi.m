function x_old = jacobi(A, b, k)
    n = height(A);

    % stima iniziale
    x_old = zeros(n, 1);
    
    % imposta le matrici D E F
    D = diag(A);
    EF = -A + diag(D); % D e' un vettore

    % imposta c
    c = b ./ D;

    for j = 1:k
        x_new = (EF * x_old) ./ D + c;
        x_old = x_new;

        % stampa informazioni
        fprintf("it = %d, res = %.3f\n", j, norm(b - A*x_new));
    end
end