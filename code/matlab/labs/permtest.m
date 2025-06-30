A = [1 0 0 1; 2 5 0 -3; 0 1 3 6; 2 0 0 -1];

P = perms(1:4);
n = size(P, 1);

mask = [1 1 1 1; 1 1 1 1; 0 0 1 1; 0 0 1 1];

for i = 1:n
    p = P(i, :);
    a = A(p, p);

    if ((a ~= 0) | (mask ~= 0)) == (mask ~= 0)
        disp(p);
    end
end