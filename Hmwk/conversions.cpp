//User Libraries
#include <cstdlib>
#include <cstdio>
using namespace std;

//Program Functions
void convert(char *,int,int,int);
void blnkRep(char *,int);
void destroy(char *);
char charRep(int);

int main() {
	//Declare program variables
	int  bits  = 8, decimal, base;
	char *cRep = new char[bits];
	//Scan User Input
	printf("Enter a number:");
	scanf("%i", &decimal);
	printf("Enter your desired base: ");
	scanf("%i", &base);
	//Perform Conversion
	convert(cRep, bits,  decimal, base);
	//Output representations to user
	printf("String Representation: %s \n", cRep);
	//Free Memory
	destroy(cRep);
}

/* Converts int decimal value to specified base representation */
void convert(char *cRep, int bits, int decimal, int base) {
	//Conversion Variables
  	int index = 1, remainder;
  	//Set binary/octal/hex string representation to 0's
  	blnkRep(cRep,bits);
  	//Perform division algorithm
  	while (decimal != 0) {
    	remainder = decimal % base;
    	decimal /= base;
    	(remainder < 10) ? cRep[bits - index] = '0' + remainder:
                       	 cRep[bits - index] = charRep(remainder);
    	index++;
  	}
}

/* Sets character representation to all zeros */
void blnkRep(char *cRep,int bits) {
  	for (int i = 0; i < bits; i++)
    	cRep[i] = '0';
  	cRep[bits] = '\0';
}

/* Frees memory in dynamic array */
void destroy(char *array) {
  	delete [] array;
}

/* Returns character representation of a 'number', including numbers > 9 */
char charRep(int value) {
  	return static_cast<char>('A' + (value - 10));
}