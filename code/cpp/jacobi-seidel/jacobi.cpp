#include <iostream>
#include "mat.h"

double* jacobi(unsigned n, unsigned k, double** A, double* b) {
	// inizializza vettori
	double* v1, *v2;
	v1 = new double[n];
	v2 = new double[n];

	for(int r = 0; r < n; r++) {
		v1[r] = 0;
	}

	for(int i = 0; i < k; i++) {
		std::cout << "Iterazione " << i + 1 << std::endl;

		std::cout << "Il vettore vecchio e':" << std::endl;
		print_vector(v1, n);
		
		for(int r = 0; r < n; r++) {
			v2[r] = b[r];

			for(int c = 0; c < n; c++) {
				if(r == c) continue;

				v2[r] -= A[r][c] * v1[c];
			}

			v2[r] /= A[r][r];
		}

		vec_copy(n, v2, v1);

		std::cout << "Il vettore nuovo e':" << std::endl;
		print_vector(v1, n);
		std::cout << std::endl;
	}

	// ripulisci
	delete[] v2;
	
	return v1;
}

int main() {
	// inizializza ambiente
	unsigned n, k; double** A; double* b;
	init_env(n, k, A, b);

	double* x = jacobi(n, k, A, b);

	std::cout << "Il risultato finale e':" << std::endl;
	print_vector(x, n);
	std::cout << std::endl;

	delete[] x;

	// ripulisci
	clean_env(n, A, b);
	return 0;
}
