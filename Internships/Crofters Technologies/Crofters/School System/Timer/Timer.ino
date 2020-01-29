#include <Time.h>
#include <TimeLib.h>

int led=1;
int t;
int c;

void setup() 
{
pinMode(led,OUTPUT);
}

void loop() 
{
  t=minute();
c=0;
while(c<1)
{ 
  if(t!=minute())
  {
    t=minute();
    c++;
  }
  digitalWrite(led,HIGH);

  }
  c=0;
  while(c<10)
{ 
  if(t!=minute())
  {
    t=minute();
    c++;
  }
  digitalWrite(led,LOW);
}

  
}

