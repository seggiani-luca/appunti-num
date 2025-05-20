function x0 = nonlin_r2_ex(x0)
    % fixed point
    phi1 = @(x1, x2) 0.25 * (x1.^2 + x2.^2);
    phi2 = @(x1, x2) 2 - x1;
    
    % iterations
    k = 100;
    
    for i = 1:k
        x1 = zeros(2, 1);
        x1(1) = phi1(x0(1), x0(2));
        x1(2) = phi2(x0(1), x0(2));
        
        fprintf("\nx0: (%d, %d)\n", x0(1), x0(2));
        fprintf("x1: (%d, %d)\n", x1(1), x1(2));

        plot([x0(1), x1(1)], [x0(2), x1(2)], 'r-');
        x0 = x1;
    end
end