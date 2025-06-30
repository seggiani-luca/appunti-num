syms x h f_xim1 f_xi m_im1 m_i x_im1 x_i

% Define the two parts of the polynomial
term1 = ( f_xim1 + ( m_im1 + (2*f_xim1)/h ) * (x - x_im1) ) * ((x - x_i)/h)^2;
term2 = ( f_xi + ( m_i - (2*f_xi)/h ) * (x - x_i) ) * ((x - x_im1)/h)^2;

% Add the terms to get the full polynomial
p = expand(term1 + term2);

% Collect like powers of x
p_collected = collect(p, x);

% Display coefficients on the canonical basis
coeffs_vec = coeffs(p_collected, x, 'All'); % All powers including 0

disp('Coefficients of {1, x, x^2, x^3}:');
disp(coeffs_vec);
