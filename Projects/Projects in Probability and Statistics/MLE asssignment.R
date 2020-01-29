loglike.normal = function(theta, x) 
{
        ans = sum(dnorm(x, theta[1], theta[2], log=TRUE))
        return(-ans) 
}
n = 1000
set.seed(5)
x = rnorm(n, mean=3, sd=4)
mu=mean(x)
standarddeviation=sd(x)
theta = c(mu,standarddeviation)
ans = optim(par=theta, fn=loglike.normal, x=x, method="BFGS")
ans$par
mean(x)
sqrt(var(x)*(n-1)/n)



loglike.poisson = function(theta, x) 
{
        ans <- sum(dpois(x, theta[1], log=TRUE))
        return(-ans) 
}
n = 1000
x=rpois(1000,0.5)
mu=mean(x)
theta=c(mu)
ans = optim(par=theta, fn=loglike.poisson, x=x, method="BFGS")
ans$par
mean(x)
var(x)*(n-1)/n


loglike.beta = function(theta, x) 
{
        ans = sum(dbeta(x, theta[1], theta[2], log=TRUE))
        return(-ans) 
}
n = 1000
x=rbeta(1000,2,5)
mu=mean(x)
variance=var(x)
alpha = (((mu^2)-(mu^3)-(variance*mu))/variance)
beta = (alpha*(1-mu))/mu
theta=c(alpha,beta)
ans = optim(par=theta, fn=loglike.beta, x=x, method="BFGS")
ans$par
mean(x)
var(x)*(n-1)/n

loglike.gamma = function(theta, x) 
{
        ans = sum(dgamma(x, theta[1], theta[2], log=TRUE))
        return(-ans) 
}
n = 1000
x=rgamma(1000,2,5)
mu=mean(x)
variance=var(x)
beta=mu/variance
alpha=mu*beta
theta = c(alpha,beta)
ans = optim(par=theta, fn=loglike.gamma, x=x, method="BFGS")
ans$par
mean(x)
var(x)*(n-1)/n

loglike.chisquare = function(x, theta) 
{
        ans <- sum(dchisq(x, theta[1], log = TRUE))
        return(-ans) 
}
n = 1000
x=rchisq(100,30)
df=mean(x)
theta=c(df)
ans = optim(par=theta, fn=loglike.chisquare, x=x, method="BFGS")
ans$par
mean(x)
var(x)*(n-1)/n

loglike.exponential = function(x, theta) 
{
        ans <- sum(dexp(x, theta, log = TRUE))
        return(-ans) 
}
n = 1000
x=rexp(1000, 5)
rate=1/mean(x)
theta=c(rate)
ans = optim(par=theta, fn=loglike.exponential, x=x, method="BFGS")
ans$par
mean(x)
var(x)*(n-1)/n



loglike.binomial = function(theta, x) # This function generetes the first derivative of negative log likelihhod for the given binomial distribution. dbinom function is the first derivative for the binomial distribution.
{
        ans <- sum(dbinom(x,size=theta[1],prob=theta[2], log=TRUE))
        return(-ans) 
}
set.seed(1)
n = 1000
x=rbinom(n,10,0.5)
mu=mean(x)
variance=var(x)
q=variance/mu
p=1-q
size=as.numeric(round(mu/p))
theta=c(size,p) 
ans = optim(par=theta, fn=loglike.binomial, x=x) 
ans$par
theta 


loglike.geometric = function(theta, x) 
{
        ans <- sum(dgeom(x, theta[1], log=TRUE))
        return(-ans) 
}
set.seed(1)
n = 1000
x=rgeom(n,0.2)
p=1/mean(x)
theta=c(p)
ans = optim(par=theta, fn=loglike.geometric, x=x) 
ans$par
theta 



p0 <- ks.test(x, "pbeta", ans$par[1], ans$par[2], exact = FALSE)$statistic # Generating the statistics for KS test of beta distribution 
p1 <- NULL
loglike.beta = function(theta, x) # This function generates the first derivative of the negative log likelihood function. dbeta function is the first derivative of beta distribution
{
        ans = sum(dbeta(x, theta[1], theta[2], log=TRUE))
        return(-ans) 
}
n = 1000
for (i in 1:100) {
        x=rbeta(n,2,5)
        mu=mean(x)
        variance=var(x)
        # Calculating the parameters of beta distribution using method of moments and storing the result as a list in theta
        alpha = (((mu^2)-(mu^3)-(variance*mu))/variance)
        beta = (alpha*(1-mu))/mu
        theta=c(alpha,beta)
        ans = optim(par=theta, fn=loglike.beta, x=x, method="BFGS")
        x_star <- rbeta (n, ans$par[1] , ans$par[2])
        p_star <- ks.test(x, "pbeta", ans$par[1], ans$par[2], exact = FALSE)$statistic
        p1 <- c(p1, p_star)
}
pvalue <- sum(p1 > p0)/100




