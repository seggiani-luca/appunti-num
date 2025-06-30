f = @(x) exp(x) + 10 ./ x.^2;
bl = 1; bu = 2;
k = 1000;

err = zeros(k, 1);

i_lab = integral(f, bl, bu);

for i = 1:k
    i_tra = simpson_gen(f, bl, bu, i);
    err(i) = abs(i_lab - i_tra);
end