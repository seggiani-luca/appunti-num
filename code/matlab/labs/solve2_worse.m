function [x1, x2] = solve2_worse(a, b, c)
    d = b^2 - 4 * a * c;

    x1 = (-b + sqrt(d)) / (2 * a);
    x2 = (-b - sqrt(d)) / (2 * a);
end