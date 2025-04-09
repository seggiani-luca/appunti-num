#ifndef MAT_H
#define MAT_H

#include <iostream>

inline double** get_matrix(unsigned n) {
	double** A = new double*[n];

	for(int r = 0; r < n; r++) {
		A[r] = new double[n];
		
		for(int c = 0; c < n; c++) {
			double e;
			std::cout << "Inserisci l'entrata " << r + 1 << ", " << c + 1 << " di A" << std::endl;
			std::cin >> e;

			A[r][c] = e;
		}
	}

	return A;
}

inline double* get_vector(unsigned n) {
	double* b = new double[n];

	for(int r = 0; r < n; r++) {
		double e;
		std::cout << "Inserisci l'entrata " << r + 1 << " di b" << std::endl;
		std::cin >> e;
		
		b[r] = e;
	}

	return b;
}

inline void print_matrix(double** A, unsigned n) {
	for(int r = 0; r < n; r++) {
		for(int c = 0; c < n; c++) {
			std::cout << A[r][c] << "\t";
		}
		std::cout << std::endl;
	}
}

inline void print_vector(double* b, unsigned n) {
	for(int r = 0; r < n; r++) {
		std::cout << b[r] << std::endl;
	}
}

inline void init_env(unsigned &n, unsigned &k, double** &A, double* &b) {
	// prendi dati 
	std::cout << "Inserisci la dimensione n" << std::endl;
	std::cin >> n;
	std::cout << std::endl;
	
	std::cout << "Inserisci il numero di iterazioni k" << std::endl;
	std::cin >> k;
	std::cout << std::endl;
	
	std::cout << "Inserzione della matrice A" << std::endl;
	A = get_matrix(n);
	std::cout << std::endl;

	std::cout << "Inserzione del vettore b" << std::endl;
	b = get_vector(n);
	std::cout << std::endl;

	// conferma dati
	std::cout << "La matrice A e':" << std::endl;
	print_matrix(A, n);
	std::cout << std::endl;

	std::cout << "Il vettore b e':" << std::endl;
	print_vector(b, n);
	std::cout << std::endl;
}

inline void clean_env(unsigned n, double** A, double* b) {
	// ripulisci
	for(int r = 0; r < n; r++) {
		delete[] A[r];
	}
	delete[] A;

	delete[] b;
}

inline void vec_copy(unsigned n, double* v1, double* v2) {
	for(int r = 0; r < n; r++) {
		v2[r] = v1[r];
	}
}

inline void clean_matrix(double** mat, unsigned n) {
	for(int r = 0; r < n; r++) {
		delete[] mat[r];
	}
	delete[] mat;

	mat = nullptr;
}

#endif
