function disegna_gersh(A, col)
    if nargin < 2
        col = 'b';
    end

    n = size(A, 1);
    if size(A, 2) ~= n
        error("weird matrix sizing");
    end

    % clf;
    hold on;
    
    for i = 1:n
        r = sum(abs(A(i, [1:i - 1, i + 1:n])));
        c = A(i, i);

        circle(c, r, col);
    end

    alpha(.15);

    % eigvs = eig(A);
    % plot(real(eigvs), imag(eigvs), '*r');

    axis('equal');
    hold off;
end