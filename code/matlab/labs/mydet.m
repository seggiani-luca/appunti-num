function d = mydet(A)
    function m = minor(A, i)
        l = A(2:n, 1:i - 1);
        r = A(2:n, i + 1:n);
        m = [l, r];
    end

    n = size(A, 1);
    if n ~= size(A, 2)
        error("weird matrix size");
    end
    
    if n == 2
        d = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);
    else
        d = 0;

        for i = 1:n
            d = d + A(1, i) * (-1)^(i - 1) * mydet(minor(A, i));
        end
    end
end