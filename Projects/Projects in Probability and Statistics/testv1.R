my_function <- function(n,p)
{
        yn <- rbinom(1000,n,p)
        zn<-cos(2*pi*(yn/n))
        sdzn<-sd(zn)  
        return(sdzn)
}
n<-seq(1,100,by=1)
yaxisvalues<-lapply(n,my_function,0.2)
xaxisvalues<-1/sqrt(n)
plot(xaxisvalues,yaxisvalues)

