% scrivere una funzione "potenze" che prende in ingresso:
%   1) A matrice quadrata
%   2) z vettore
%   3) maxit intero
% esegua maxit iterazioni:
%   z_0 = \frac{z}{|z|_2}
%   z_{k + 1} = \frac{A z_k}{|A z_k|_2}
% e restituisca:
%   1) y vettore approssimazione dell'autovettore dominante di A
%   2) lamvec vettore contenente la successione dell'autovalore, da cui
%   calcoleremo l'errore:
%       err_n = |\frac{lambda1 - lambda1^k}{lambda1}|
%       lambda_1^k = z_k^H A z_k
% inoltre si scriva uno script che generi A e z, e in modo casuale per n =
% 100 mostri su un grafico in scala logaritmica sulle y la successione 
% err_n.
