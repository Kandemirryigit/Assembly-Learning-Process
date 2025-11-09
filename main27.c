/*
- Leraning signed and unsigned data type
*/

#include <stdio.h>


// unsigned means: can store only positive numbers (but larger range)
// signed means: can store both positive and negative numbers

// signed char is: -128 → 127
// unsigned char is: 0 → 255

// signed int is: -2,147,483,648 → 2,147,483,647
// unsdigned int is: 0 → 4,294,967,295

int main()
{
    unsigned int x=10;  // To store positive numbers
    signed int y=-10;  // To store negative numbers

    printf("Unsigned int x is: %d",x);
    printf("\nSigned int y is: %d",y);

    return 0;


}