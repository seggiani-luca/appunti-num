function [x1, x2] = solve2(a, b, c)
    d = b^2 - 4 * a * c;

    if b > 0
        x2 = (-b - sqrt(d)) / (2 * a);
        x1 = c / (a * x2);
    else
        x1 = (-b + sqrt(d)) / (2 * a);
        x2 = c / (a * x1); 
    end
end