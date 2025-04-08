function [Q, A] = opt_qr_decomp(A)
    function [a, b] = householder_vec(v)
        vt = v;

        if vt(1) < 0
            vt(1) = vt(1) - norm(v); % si sottrae
        else
            vt(1) = vt(1) + norm(v);
        end
        
        a = vt;
        b = vt / norm(vt)^2 * 2;
    end

    function A = rank_one_l(A, a, b, i)
        A(i:end, :) = A(i:end, :) ...
                          - a * b' * A(i:end, :);
    end

    function A = rank_one_r(A, a, b, i)
        A(:, i:end) = A(:, i:end) ...
                          - A(:, i:end) * a * b';
    end

    n = height(A);

    Q = eye(n);

    for i = 1:n
        [a, b] = householder_vec(A(i:end, i));
        A = rank_one_l(A, a, b, i);
        Q = rank_one_r(Q, a, b, i);
    end
end