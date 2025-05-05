function j = simpson_int(f, a, b, L)
    xi = linspace(a, b, L + 1)';
    pi = xi(1:L) + (b - a) / (2 * L);
    yi = f(xi);
    ypi = f(pi);

    % stampa
    clf;
    hold on;

    % funzione
    fplot(f, [a, b], 'r');

    % punti
    plot(xi, yi, 'ob');

    % parabole
    for i = 1:L
        x0 = xi(i); x1 = xi(i + 1);
        p = pi(i); yp = ypi(i);
        y0 = yi(i); y1 = yi(i + 1);

        p = polyfit([x0, p, x1], [y0, yp, y1], 2);
        q = @(x) polyval(p, x);
        
        fplot(q, [x0, x1], 'b')
    end

    hold off;

    % integra
    j = yi(1) + 2 * sum(yi(2:L)) + 4 * sum(ypi) + yi(L + 1);
    j = j * (b - a) / (6 * L);
end