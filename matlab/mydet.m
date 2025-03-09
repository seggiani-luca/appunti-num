function d = mydet(A)
    function sub = submatrix(A, i)
        left = A(2:end, 1:i-1);
        right = A(2:end, i+1:end);

        sub = [left, right];
    end

    if (height(A) == 1) && (width(A) == 1)
        d = A(1, 1);
        return;
    end

    d = 0;
    for i = 1:width(A)
        d = d + A(1, i) * mydet(submatrix(A, i)) * (-1)^(i + 1);
    end
end