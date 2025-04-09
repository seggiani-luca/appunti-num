#include <iostream>
#include "mat.h"

double* seidel(unsigned n, unsigned k, double** A, double* b) {
	// inizializza vettori
	double* v1;
	v1 = new double[n];

	for(int r = 0; r < n; r++) {
		v1[r] = 0;
	}

	for(int i = 0; i < k; i++) {
		std::cout << "Iterazione " << i + 1 << std::endl;

		std::cout << "Il vettore vecchio e':" << std::endl;
		print_vector(v1, n);
		
		for(int r = 0; r < n; r++) {
			v1[r] = b[r];

			for(int c = 0; c < n; c++) {
				if(r == c) continue;

				v1[r] -= A[r][c] * v1[c];
			}

			v1[r] /= A[r][r];
		}

		std::cout << "Il vettore nuovo e':" << std::endl;
		print_vector(v1, n);
		std::cout << std::endl;
	}
	
	return v1;
}

int main() {
	// inizializza ambiente
	unsigned n, k; double** A; double* b;
	init_env(n, k, A, b);

	double* x = seidel(n, k, A, b);

	std::cout << "Il risultato finale e':" << std::endl;
	print_vector(x, n);
	std::cout << std::endl;

	delete[] x;

	// ripulisci
	clean_env(n, A, b);
	return 0;
}
