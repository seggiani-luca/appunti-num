function [Q, A] = my_qr(A)
    m = size(A, 1);
    n = size(A, 2);

    Q = eye(m);

    for i = 1:n
        Hv = hous_matrix(A(i:m, i));
        Hi = blkdiag(eye(i - 1), Hv);
        A = Hi * A;
        Q = Q * Hi';
    end
end