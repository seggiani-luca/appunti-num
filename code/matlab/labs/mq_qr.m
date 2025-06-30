function x = mq_qr(A, b)
    [Q, R] = my_qr(A);
    
    n = size(A, 2);
    
    R = R(1:n, :);
    c = Q' * b;
    c = c(1:n);

    x = R \ c;
end