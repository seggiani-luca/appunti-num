function [Q, A] = qr_decomp(A)
    n = height(A);
    Q = eye(n); % accumulatore

    for i = 1:n
        Hi = householder(A(i:end, i));
        Hi = blkdiag(eye(i - 1), Hi);
        A = Hi * A;
        Q = Q * Hi;
    end
end