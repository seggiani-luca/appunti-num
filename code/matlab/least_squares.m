function x = least_squares(A, b)
    [Q, R] = qr_decomp(A);
    c = Q' * b;

    % trova righe a zero
    tol = 1e-12;
    R_diag = abs(diag(R));
    r = find(R_diag > tol, 1, 'last');

    R_trunc = R(1:r, 1:r);
    c_trunc = c(1:r);

    % risolvi il sistema superiore
    x1 = bck_subst(R_trunc, c_trunc);

    % reinserisci gli zeri
    x = [x1; zeros(size(R,2) - r, 1)];
end