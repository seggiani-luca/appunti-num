#include <iostream>
#include "mat.h"
#include <cmath>

void householder_vec(double** A, unsigned i, unsigned n, double* a, double* b) {
	double sqr_norm = 0;

	// prendi la i-esima colonna di A
	for(unsigned j = i; j < n; j++) {
		a[j - i] = A[j][i];
		sqr_norm += a[j - i] * a[j - i];
	}

	double norm = std::sqrt(sqr_norm);
	sqr_norm -= a[0] * a[0];

	if(a[0] < 0) {
		a[0] -= norm;
	} else {
		a[0] += norm;
	}

	sqr_norm += a[0] * a[0];

	for(unsigned j = 0; j < n - i; j++) {
		b[j] = 2 * a[j] / sqr_norm;
	}
}

void rank_one_l(double** A, unsigned i, unsigned n, double* a, double* b) {
	// A(i:end, :) = A(i:end, :) - a * b' * A(i:end, :);
	for(unsigned c = 0; c < n; c++) {
		double sum = 0;

		for(unsigned r = i; r < n; r++) {
			sum += b[r - i] * A[r][c]; 
		}

		for(unsigned r = i; r < n; r++) {
			A[r][c] -= a[r - i] * sum;
		}
	}
}

void rank_one_r(double** A, unsigned i, unsigned n, double* a, double* b) {
	// A(i:end, :) = A(i:end, :) - (A(i:end, :) * a) * b';
	for(unsigned r = 0; r < n; r++) {
		double sum = 0;

		for(unsigned c = i; c < n; c++) {
			sum += A[r][c] * a[c - i]; 
		}

		for(unsigned c = i; c < n; c++) {
			A[r][c] -= sum * b[c - i];
		}
	}
}

void qr_decomp(double** A, double** Q, unsigned n) {
	// inizializza vettori a, b
	double* a, *b;
	a = new double[n];
	b = new double[n];

	for(unsigned i = 0; i < n; i++) {
		std::cout << "Passaggio " << i << std::endl;

		householder_vec(A, i, n, a, b);

		std::cout << "I vettori di Householder sono:" << std::endl;
		std::cout << "a:" << std::endl;
		print_vector(a, n - i);
		std::cout << "b:" << std::endl;
		print_vector(b, n - i);

		rank_one_l(A, i, n, a, b);
		rank_one_r(Q, i, n, a, b);

		std::cout << std::endl;
	}

	// ripulisci
	delete[] a;
	delete[] b;
}

int main() {
	// prendi dati
	unsigned n;
	std::cout << "Inserisci la dimensione n" << std::endl;
	std::cin >> n;

	double** A;
	std::cout << "Inserzione della matrice A" << std::endl;
	A = get_matrix(n);

	std::cout << std::endl;
	std::cout << "La matrice A e':" << std::endl;
	print_matrix(A, n);
	std::cout << std::endl;

	// inizializza Q
	double** Q = new double*[n];
	for(int r = 0; r < n; r++) {
		Q[r] = new double[n];
		
		// identita'
		for(int c = 0; c < n; c++) {
			if(r == c) {
				Q[r][c] = 1;
			} else {
				Q[r][c] = 0;
			}
		}
	}

	// effettua la decomposizione QR
	qr_decomp(A, Q, n); // A va in R, Q gliela forniamo allocata

	std::cout << "La matrice Q e':" << std::endl;
	print_matrix(Q, n);
	
	std::cout << "La matrice R e':" << std::endl;
	print_matrix(A, n);

	// ripulisci
	clean_matrix(A, n);
	clean_matrix(Q, n);

	return 0;
}
