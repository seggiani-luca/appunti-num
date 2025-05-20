function [x1, i] = newton_raphson(f, x0, k, tol)
    vars = symvar(f); 

    if nargin < 5
        tol = 0.01;
    end

    if nargin < 4
        k = 100;
    end

     % differentiate
     j = jacobian(f, vars);

    for i = 1:k
        % print info
        fprintf("\nIteration %d\n", i);
        fprintf("\tx: (%.4f, %.4f)\n", x0(1), x0(2));

        f0 = subs(f, vars, x0');
        j0 = subs(j, vars, x0');

        % solve j0 y = f0
        y0 = j0 \ f0;
        x1 = x0 - y0;

        % tolerance
        if norm(x1 - x0) < tol
            break;
        end
        
        % plot
        plot([x0(1), x1(1)], [x0(2), x1(2)], 'r-');

        x0 = x1;
    end
end