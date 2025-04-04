function H = householder(v)
    H = eye(length(v));
    vt = v;

    if vt(1) < 0
        vt(1) = vt(1) - norm(v); % si sottrae
    else
        vt(1) = vt(1) + norm(v);
    end
    
    H = H - 2 * vt * vt' / norm(vt)^2;
end