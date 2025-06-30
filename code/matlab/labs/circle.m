function circle(z, r, col)
    t = linspace(0, 2 * pi, 100);
    x = r * cos(t) + real(z);
    y = r * sin(t) + imag(z);

    patch(x, y, col);
end