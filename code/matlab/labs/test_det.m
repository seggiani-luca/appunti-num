t = 1:100:1000;
mydet_times = zeros(10, 1);
mydet2_times = zeros(10, 1);
det_times = zeros(10, 1);

for i = 1:10
    n = t(:, i);
    A = randn(n, n);
    
    if i <= 1
        tic;
        mydet(A);
        mydet_times(i) = toc;
    end

    tic;
    mydet2(A);
    mydet2_times(i) = toc;

    tic;
    det(A);
    det_times(i) = toc;
end

clf;

loglog(1:10, mydet_times');

hold on;

loglog(t', mydet2_times);
loglog(t', det_times);
loglog(t, 10^-7* t.^3); % ref

hold off;