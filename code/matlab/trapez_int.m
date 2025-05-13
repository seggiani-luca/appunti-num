function j = trapez_int(f, a, b, L, print)
    if nargin < 5 
        print = false 
    end

    xi = linspace(a, b, L + 1)';
    yi = f(xi);

    if print
        % stampa
        clf;
        hold on;
    
        % funzione
        fplot(f, [a, b], 'r');
    
        % punti
        plot(xi, yi, 'ob');
    
        % rette
        for i = 1:L
            x0 = xi(i); x1 = xi(i + 1);
            y0 = yi(i); y1 = yi(i + 1);
    
            m = (y1 - y0) / (x1 - x0);
            r = @(x) m * (x - x0) + y0;
            
            fplot(r, [x0, x1], 'b')
        end
    
        hold off;
    end

    % integra
    j = yi(1) + yi(L + 1) + 2 * sum(yi(2:L)); 
    j = j * (b - a) / (2 * L);
end