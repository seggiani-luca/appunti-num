function a = myexp3(x)
    function a = part_sum(x)
        % x = sum(x^n / n!)
        
        t = 1;
        a = 1;
        
        for i = 1:500 % 500 fisso
            t = t * (x / i);
            a = a + t;
        end
    end
    
    if x < 0
        a = 1 / part_sum(-x);
    else
        a = part_sum(x);
    end
end