function x = mq_normali(A, b)
    A1 = A' * A;
    b1 = A' * b;

    x = A \ b;
end