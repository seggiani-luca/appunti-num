function n = time_matrix(num, base, mul)
    if nargin < 3
        mul = 100;
    end
    if nargin < 2
        base = 2;
    end

    n = zeros(num, 1);
    for i = 1:num
        n(i) = base^(i - 1) * mul;
    end

    times = zeros(num, 1);

    for i = 1:num
        A = randn(n(i));
        B = randn(n(i));
        tic;
        C = A * B;
        times(i) = toc;
    end

    loglog(n, times);
    xlabel('Size');
    ylabel('Computation Time (s)');
end