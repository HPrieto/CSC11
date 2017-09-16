//User Libraries
#include <cstdlib>
#include <cstdio>
using namespace std;

//Program Functions
void convert(char *,int,int,int);
void blnkRep(char *,int);
void destroy(char *);
char charRep(int);
int  inptDcm();
int  inptBse();

int main() {
    //Declare program variables
    int  bits  = 8, decimal = inptDcm(), base = inptBse();
    char *cRep = new char[bits];
    //Perform Conversion
    convert(cRep, bits,  decimal, base);
    //Output representation to user
    printf("String Representation: %s \n", cRep);
    //Free Memory
    destroy(cRep);
}

/* Prompt user for decimal value and return */
int inptDcm() {
    //Method variables
    int decimal;
    //Scan User Input
    printf("Enter a number:");
    scanf("%i", &decimal);
    return decimal;
}

/* Prompt user for value base and return */
int inptBse() {
    //Method variables
    int base;
    //Scan User Input
    printf("Enter your desired base: ");
    scanf("%i", &base);
    return base;
}

/* Converts decimal value to specified base representation */
void convert(char *cRep, int bits, int decimal, int base) {
	  //Conversion Variables
  	int index = 1, remainder;
  	//Set string representation to 0's
  	blnkRep(cRep,bits);
  	//Perform division algorithm
  	while (decimal != 0) {
        remainder = decimal % base;
        (remainder < 10) ? cRep[bits - index] = '0' + remainder:
                           cRep[bits - index] = charRep(remainder);
        decimal /= base;
        index++;
  	}
}

/* Sets character representation to all zeros */
void blnkRep(char *cRep, int bits) {
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