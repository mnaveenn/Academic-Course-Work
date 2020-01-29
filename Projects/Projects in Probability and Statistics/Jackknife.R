library(bootstrap)
# The Manly data
x <- c(3.56, 0.69, 0.10, 1.84, 3.93, 1.25, 0.18, 1.13, 0.27, 0.50,
       0.67, 0.01, 0.61, 0.82, 1.70, 0.39, 0.11, 1.20, 1.21, 0.72)
# Sample mean
mean(x)


myJackknife<-function(v1,statfunc=mean)
{
        n1<-length(v1)
        jackvec<-NULL
        mu0<-statfunc(v1)
        for(i in 1:n1){
                mua<-statfunc(v1[-i])
                jackvec<-c(jackvec, n1*(mu0)-(n1-1)*mua)
        }
        jackbias<-mean(jackvec)-mu0
        jacksd<-sd(jackvec)
        list(mu0=mu0,jackbias=jackbias,jacksd=jacksd,jackvec=jackvec)
}


# Jackknife the mean
jackmean <- jackknife(x,mean)
jackmean
# Bias-corrected jackknife estimate
meanjack = mean(x) - jackmean$jack.bias
meanjack
# Sample standard deviation
sd(x)
# Jackknife the standard deviation
jacksd <- jackknife(x,sd)
jacksd
# Bias-corrected jackknife estimate
sdjack = sd(x) - jacksd$jack.bias
sdjack
# Sample standard deviation with n in denominator (MLE)
sdmle <- function(x)(sqrt((length(x)-1)/length(x))*sd(x))
sdmle(x)
# Jackknife the MLE standard deviation (denominator with n)
jacksdmle <- jackknife(x,sdmle)
jacksdmle
# Bias-corrected jackknife estimate
sdmlejack = sdmle(x) - jacksdmle$jack.bias
sdmlejack
# Sample variance
var(x)
# Jackknife the variance
jackvar <- jackknife(x,var)
jackvar
# Bias-corrected jackknife estimate
varjack = var(x) - jackvar$jack.bias
varjack