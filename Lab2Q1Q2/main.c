#include <msp430.h> 
float b;
signed int sum(signed int s1, signed int s2){
    signed int total = s1 + s2;
    return total;
}
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    ///Question 1 PART A
    int a;
    a+=1;
    ///Question 1 PART B

    b-=1;
    ///Question 1 PART C
    unsigned char c = 0x0a01;
    unsigned char d = 0x0a11;
    unsigned char e = c | d;
    unsigned char f= c & d;

    ///Question 2
     signed int g = -32768;
     signed int h = -32768;
     signed int i = sum(g,h);
     signed int k = g + h;
    ///Question 3
        ///Assembly code
    return 0;
}
