posteriorpoisson<-function(n,alpha,beta)
{
        priordist=rgamma(n,alpha,beta)
        mu=mean(priordist)
        variance=var(priordist)
        beta_hat=mu/variance
        alpha_hat=mu*beta_hat
        lambda=alpha_hat*beta_hat
        data=rpois(n,lambda)
        alpha_new=alpha+sum(data)
        beta_new=beta+n
        return(list(prior_distribution="Gamma", posterior_distribution="Gamma",alpha_new=alpha_new,beta_new=beta_new))
}
posteriornegativebinomial<-function(n,r,alpha,beta)
{
        priordist=rbeta(n,alpha,beta)
        mu=mean(priordist)
        variance=var(priordist)
        alpha_hat = (((mu^2)-(mu^3)-(variance*mu))/variance)
        beta_hat = (alpha_hat*(1-mu))/mu
        w=(alpha_hat/(alpha_hat+beta_hat))
        data=rnbinom(n,r,w)
        alpha_new=alpha_hat+r*n
        beta_new=beta_hat+sum(data)
        return(list(prior_distribution="Beta",posterior_distribution="Beta",alpha_new=alpha_new,beta_new=beta_new))
}

posteriorexponential<-function(n,alpha,beta)
{
        priordist=rgamma(n,alpha,beta)
        mu=mean(priordist)
        variance=var(priordist)
        beta_hat=mu/variance
        alpha_hat=mu*beta_hat
        lambda=alpha_hat*beta_hat
        data=rexp(n,lambda)
        alpha_new=alpha+n
        beta_new=beta+sum(data)
        return(list(prior_distribution="Gamma", posterior_distribution="Gamma",alpha_new=alpha_new,beta_new=beta_new))
}

posteriorbinomial<-function(n,alpha,beta)
{
        priordist=rbeta(n,alpha,beta)
        mu=mean(priordist)
        variance=var(priordist)
        alpha_hat = (((mu^2)-(mu^3)-(variance*mu))/variance)
        beta_hat = (alpha_hat*(1-mu))/mu
        w=(alpha_hat/(alpha_hat+beta_hat))
        data=rbinom(n,r,w)
        alpha_new=alpha_hat+r*n
        beta_new=beta_hat+sum(data)
        return(list(prior_distribution="Beta",posterior_distribution="Beta",alpha_new=alpha_new,beta_new=beta_new))
}

posterior_normal_mu_unknown_precision_unknown<-function(n,mu,tau,r,alpha,beta)
{
        priordist=rnorm(n,mu,1/tau)
        mu_hat=mean(priordist)
        sigma_hat=sd(priordist)
        tau_hat=1/sigma_hat
        priordist2=rgamma(n,alpha,beta)
        mu_g=mean(priordist2)
        variance_g=var(priordist2)
        beta_hat=mu_g/variance_g
        alpha_hat=mu_g*beta_hat
        r=alpha_hat/(alpha_hat+beta_hat)
        data=rnorm(n,mu_hat,1/r)
        mu_new=((tau_hat*mu_hat) + (n*x_bar))/(tau_hat + n)
        precision_new=(tau_hat+n)*r
        alpha_new=alpha_hat+(n/2)
        beta_new=beta_hat+((0.5*variance_g+tau_hat*(mu_g-mu_hat))/(2*tau_hat*n))
        return(list(prior_distribution_of_M="Normal",posterior_distribution_of_M="Normal",mu=mu_new, precision=precision_new, prior_distibution_R="Gamma",posterior_distribution_R="Gamma",alpha_new=alpha_new,beta_new=beta_new))
}







