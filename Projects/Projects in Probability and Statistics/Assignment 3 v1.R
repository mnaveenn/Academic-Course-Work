methodofmoments<-function(x,statdist)
{
        if (statdist=="rnorm")
        {
                mu=mean(x)
                variance=var(x)
                sigma=sqrt(variance)
                return(list(mu=mu,sigma=sigma))
        }
        if (statdist=="rbinom")
        {
                mu=mean(x)
                variance=var(x)
                q=variance/mu
                p=1-q
                n=mu/p
                return(list(n=n,p=p))
        }
        if (statdist=="rpois")
        {
                mu=mean(x)
                variance=var(x)
                lambda=mu
                return(list(lambda=lambda))
        }
        if (statdist=="runif")
        {
                mu=mean(x)
                variance=var(x)
                b=(sqrt(12*variance)/2)+mu
                a=(2*mu)-b
                return(list(a=a,b=b))
        }
        if (statdist=="rexp")
        {
                mu=mean(x)
                variance=var(x)
                beta=1/mu
                return(list(beta=beta))
        }
        if (statdist=="rgamma")
        {
                mu=mean(x)
                variance=var(x)
                beta=mu/variance
                alpha=mu*beta
                return(list(alpha=alpha,beta=beta))
        }
        if (statdist=="rt")
        {
                mu=mean(x)
                variance=var(x)
                v=(2*variance)/(variance-1)
                return(list(v=v))
        }
        if (statdist=="rchisq")
        {
                mu=mean(x)
                variance=var(x)
                p=mu
                return(list(p=p))
        }
        if (statdist=="rbeta")
        {
                mu=mean(x)
                variance=var(x)
                alpha = (((mu^2)-(mu^3)-(variance*mu))/variance)
                beta = (alpha*(1-mu))/mu
                return(list(alpha=alpha, beta=beta))
        }
}

