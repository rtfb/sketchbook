#include <stdio.h>

extern void vec_add_scalar(float *vec, int nelem, float *scalar);

int main() {
	float buf[] = {
		 1.0f,  2.0f,  3.0f,  4.0f,  5.0f,  6.0f,  7.0f,  8.0f,  9.0f, 10.0f,
		11.0f, 12.0f, 13.0f, 14.0f, 15.0f, 16.0f, 17.0f, 18.0f, 19.0f, 20.0f,
		21.0f, 22.0f, 23.0f, 24.0f, 25.0f, 26.0f, 27.0f, 28.0f, 29.0f, 30.0f,
		31.0f, 32.0f, 33.0f, 34.0f, 35.0f, 36.0f, 37.0f, 38.0f, 39.0f, 40.0f,
		41.0f, 42.0f, 43.0f,
	};
	float scalar = 7.0f;
	vec_add_scalar(buf, 43, &scalar);
	for (int i = 0; i < 43; i++) {
		printf("%f\n", buf[i]);
	}
	return 0;
}
