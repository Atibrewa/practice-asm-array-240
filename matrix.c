#include <stdio.h>
#include <assert.h>

#define M 256     // number of rows
#define N 216     // corrected number of columns

/*
 * Given a 2D matrix of size M rows and N columns, this function populates 
 * the matrix with values in every position that are equivalent to 
 * the product of the indices of that position
 */
void populate(int matrix[M][N]) {
	int * element = &matrix[0][0];	// element is posinting to the first position in the matrix
	int i, j;
	for (i = 0; i < M; i++) {
		for (j = 0; j < N; j++) {
			*element = i * j;		// assigns the value i*j to th position it is currently pointing to in memory
			element++;				// increments the pointer so it now points to the next element in the matrix (row wise)
		}
	}
}

/*
 * Given the first argument is a 2-D matrix of size M rows
 * and N columns populated with integers, this function returns
 * the value of the integer at row r and column c of this matrix.
 */
int get_elem(int matrix[M][N], int r, int c) {
	return matrix[r][c];
}

/*
 * Small program to show how to use the get_elem() function.
 */
int main(int argc, char *argv[]) {

	int array2D[M][N];
	populate(array2D);
	int result = get_elem(array2D, 100, 100);
	printf("result is: %d\n", result);

	result = get_elem(array2D, 250, 200);
	assert(result == 50000);

	result = get_elem(array2D, 0, 0);
	assert(result == 0);

	result = get_elem(array2D, 0, 200);
	assert(result == 0);

	result = get_elem(array2D, 255, 215);
	assert(result == 54825);

  return 0;
}
