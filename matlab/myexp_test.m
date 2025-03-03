count = 100;
l = -30;
u = 30;
prec = 500;

for i = 1:count
    x = l + (u - l) / count * i;
    r_abs = myexp(x, prec) - exp(x);
    r_rel = r_abs / exp(x);

    % fprintf("x: " + x + "\n");
    % fprintf("absolute: " + r_abs + "\n");
    fprintf("relative: " + r_rel + "\n");
end