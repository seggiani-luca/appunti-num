function d = mydet2(A)
    U = my_gauss(A);
    d = prod(diag(U));
end