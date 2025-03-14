function draw_gersh(A, draw_eigen)
    % draws a circle
    function circle(center, radius, col)
        t = linspace(0, 2*pi);
        patch(radius * cos(t) + real(center), ...
              radius * sin(t) + imag(center), col);
    end

    if nargin < 2
        draw_eigen = true;
    end

    n = size(A, 1);

    % graph setup
    close all;
    hold on;
    axis('equal');

    for k = 1:n
        center = A(k, k);
        radius = sum(abs(A(k, [1:k-1, k+1:end])));
        circle(center, radius, 'blue');
    end

    alpha(.1)

    if draw_eigen
        eigenvals = eig(A);
        plot(real(eigenvals), imag(eigenvals), 'red.');
    end

    hold off;
end