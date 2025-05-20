function raphson_ex()
    x1 = sym('x1');
    x2 = sym('x2');

    function [x0, i] = q_nraph(x0)
        for i = 1:100
            f0 = f_handle(x0);
            j0 = j_handle(x0);
    
            % solve j0 y = f0
            y0 = j0 \ f0;
            x1 = x0 - y0;

            if norm(x1 - x0) < 0.01
                break;
            end

            x0 = x1;
        end
    end

    function c = classify(p)
        c = 1;

        if norm(alpha - p) < 0.05
            c = 0;
        end
    end

    % problem vars
    f = [(1 / 3) * (x1 - x2) + x1^2; (1 / 3) * (x2 - x1) + x1 * x2];
    j = jacobian(f, [x1, x2]);

    % use handles
    f_handle = matlabFunction(f, 'Vars', {[x1; x2]});
    j_handle = matlabFunction(j, 'Vars', {[x1; x2]});


    alpha = [0; 0];
    beta = [-2/3; 2/3];
    
    % grid vars
    n = 500;

    conv_p = zeros(n);
    conv_k = zeros(n);

    % sample grid
    [xg, yg] = meshgrid(linspace(-2, 2, n), linspace(-2, 2, n));

    for x = 1:n
        for y = 1:n
            x0 = [xg(x, y); yg(x, y)];
            
            % print info
            fprintf("\nCurrent: %.4f, %.4f\n", x0(1), x0(2));

            [p, k] = q_nraph(x0);

            conv_p(x, y) = classify(p);
            conv_k(x, y) = k;

            fprintf("\n=> converges to %d\n", conv_p(x, y));
        end
    end

    figure;
    
    % plot convergence basins
    subplot(1,2,1);
    imagesc(linspace(-2,2,n), linspace(-2,2,n), conv_p);
    colormap(hot);
    caxis([0, 1]);
    title('Convergence Basins');
    axis xy; axis equal tight;
    % colorbar;

    % plot solutions
    hold on;
    plot(alpha(1), alpha(2), 'ro', 'DisplayName', 'Alpha');
    plot(beta(1), beta(2), 'bo', 'DisplayName', 'Beta');
    hold off;

    legend;

    % plot convergence iterations
    subplot(1,2,2); 
    imagesc(linspace(-2,2,n), linspace(-2,2,n), conv_k);
    colormap(hot);
    caxis([0, 10]);
    title('Iteration Count');
    axis xy; axis equal tight;
    colorbar;
end