Jackknife<-function(v1,statfunc=mean)
{
        n1<-length(v1)
        jackvec<-NULL
        jacckbiasvec<-NULL
        jacksdvec<-NULL
        mu0<-statfunc(v1)
        for(i in 1:n1){
                mua<-statfunc(v1[-i])
                jackvec<-c(jackvec, n1*(mu0)-(n1-1)*mua)
        }
        jackbias<-mean(jackvec)-mu0
        jacksd<-sd(jackvec)
        list(mu0=mu0,jackbias=jackbias,jacksd=jacksd)
        
        n0<-length(vec0)
        mean0<-mean(vec0)
        sd0<-sqrt(var(vec0))
        # create a vector to store the location of the bootstrap studentized deviation vector
        bootvec<-NULL
        bootbiasvec<-NULL
        #create the bootstrap distribution using a for loop
        for( i in 1:nboot){
                vecb<-sample(vec0,replace=T)
                #create mean and standard deviation to studentize
                meanb<-mean(vecb)
                sdb<-sqrt(var(vecb))
                #note since resampling full vector we can use n0 for sample size of vecb
                bootvec<-c(bootvec,(meanb-mean0)/(sdb/sqrt(n0)))
                bootbiasvec<-c(bootbiasvec,meanb-mean0)
        }
        bootbias<-mean(bootbiasvec)
        lq<-quantile(bootvec,alpha/2)
        uq<-quantile(bootvec,1-alpha/2)
        #ADD the other two confidence intervals.
        #incorporate into the bootstrap confidence interval (what algebra supports this?) and output result
        LB<-mean0-(sd0/sqrt(n0))*uq
        UB<-mean0-(sd0/sqrt(n0))*lq
        #since I have the mean and standard deviation calculate the normal confidence interval here as well
        NLB<-mean0-(sd0/sqrt(n0))*qnorm(1-alpha/2)
        NUB<-mean0+(sd0/sqrt(n0))*qnorm(1-alpha/2)
        list(bootstrap.confidence.interval=c(LB,UB),normal.confidence.interval=c(NLB,NUB))
        
}
my.bootstrapci.ml<-function(vec0,nboot=10000,alpha=0.1)
{
        #extract sample size, mean and standard deviation from the original data
        n0<-length(vec0)
        mean0<-mean(vec0)
        sd0<-sqrt(var(vec0))
        # create a vector to store the location of the bootstrap studentized deviation vector
        bootvec<-NULL
        bootbiasvec<-NULL
        #create the bootstrap distribution using a for loop
        for( i in 1:nboot){
                vecb<-sample(vec0,replace=T)
                #create mean and standard deviation to studentize
                meanb<-mean(vecb)
                sdb<-sqrt(var(vecb))
                #note since resampling full vector we can use n0 for sample size of vecb
                bootvec<-c(bootvec,(meanb-mean0)/(sdb/sqrt(n0)))
                bootbiasvec<-c(bootbiasvec,meanb-mean0)
        }
        #Calculate lower and upper quantile of the bootstrap distribution
        bootbias<-mean(bootbiasvec)
                       lq<-quantile(bootvec,alpha/2)
                       uq<-quantile(bootvec,1-alpha/2)
                       #ADD the other two confidence intervals.
                       #incorporate into the bootstrap confidence interval (what algebra supports this?) and output result
                       LB<-mean0-(sd0/sqrt(n0))*uq
                       UB<-mean0-(sd0/sqrt(n0))*lq
                       #since I have the mean and standard deviation calculate the normal confidence interval here as well
                       NLB<-mean0-(sd0/sqrt(n0))*qnorm(1-alpha/2)
                       NUB<-mean0+(sd0/sqrt(n0))*qnorm(1-alpha/2)
                       list(bootstrap.confidence.interval=c(LB,UB),normal.confidence.interval=c(NLB,NUB))
}
Sim.func<-function(mu.val=3,n=30,nsim=1000)
{
        #create coverage indicator vectors for bootstrap and normal
        cvec.boot<-NULL
        cvec.norm<-NULL
        #calculate real mean
        mulnorm<-(exp(mu.val+1/2))
        #run simulation
        for(i in 1:nsim){
                if((i/10)==floor(i/10)){
                        print(i)
                        #let me know computer hasnt died
                }
                #sample the simulation vector
                vec.sample<-rlnorm(n,mu.val)
                #bootstrap it
                boot.list<-my.bootstrapci.ml(vec.sample)
                boot.conf<-boot.list$bootstrap.confidence.interval
                norm.conf<-boot.list$normal.confidence.interval
                #calculate if confidence intervals include mu
                #count up the coverage by the bootstrap interval
                cvec.boot<-c(cvec.boot,(boot.conf[1]<mulnorm)*(boot.conf[2]>mulnorm))
                #count up the coverage by the normal theory interval
                cvec.norm<-c(cvec.norm,(norm.conf[1]<mulnorm)*(norm.conf[2]>mulnorm))
        }
        #calculate and output coverage probability estimates
        list(boot.coverage=(sum(cvec.boot)/nsim),norm.coverage=(sum(cvec.norm)/nsim))
}








