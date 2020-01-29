rnorm(10)
rbinom(5,22,0.3)
rpois(10,100)
qqplot1<-function(x,dist,binom.n)
{
        n1<-length(x)
        p1<-c(1:n1)/(n1+1)
        if(dist == "pois")
        {
                q<-qpois(p1,mean(x))
        }
        if(dist == "binom")
        {
                q<-qbinom(p1,n1,mean(x/binom.n))
        }
        plot(c(0,sort(x)),c(0,q))
}




