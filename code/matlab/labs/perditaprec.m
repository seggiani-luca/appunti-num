for a = 1:300
    v = 1 - a*(1/a);
    if v ~ 0;
        fprintf("a = %d\n", a);
    end
end