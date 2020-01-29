#include<reg51.h>
#define led2 P2
#define led1 P3
void delay();
char a[11]={0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x3F};
void main()
{
int j,k;
led1=0x00;
led2=0x00;
led2=0x3F;
for(k=0;k<=9;k++)
{
led1=a[k];
delay();
for(j=0;j<=9;j++)
{
led2=a[j];
delay();


}
}
}
void delay()
{
unsigned i;
for(i=0;i<35000;i++);
}
