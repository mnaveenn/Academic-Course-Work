#include<reg51.h>
#define led1 P2
#define led2 P3
void delay();
void main()
{
int i,j;
for(i=0;i<=9;i++)
{
led1=i;
delay();
for(j=0;j<=9;j++)
{
led2=j;
delay();
}
}
}
void delay()
{
unsigned k;
for(k=0;k<=35000;k++);
}
