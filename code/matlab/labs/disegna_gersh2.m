function disegna_gersh2(A)
   clf;
   disegna_gersh(A, 'b');
   disegna_gersh(A.', 'r');
   
   hold on;

   eigvs = eig(A);
   plot(real(eigvs), imag(eigvs), '*r');

   hold off;
end