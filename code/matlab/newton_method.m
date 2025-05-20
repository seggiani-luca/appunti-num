function x0 = newton_method(f, x0, k, tol)
    if nargin < 5
        tol = 0.01;
    end

    if nargin < 4
        k = 100;
    end

    % differentiate
    syms x;
    diff_f = str2func(['@(x)', char(diff(f(x)))]);

    for i = 1:k
        % print info
        fprintf("\nIteration %d\n", i);
        fprintf("\tx: %d", x0);

        % update
        x_old = x0;
        x0 = x0 - f(x0) / diff_f(x0);
        
        % tolerance
        if abs(x0 - x_old) < tol
            break;
        end
    end
end