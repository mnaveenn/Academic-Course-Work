set.seed(1)
signcheck<-function(x){
        if(x>0){
                return(x)
        }
        else{
                return(0)
        }
}
computejsrisk<-function(X,mu,n,k){
        theta_mle=colMeans(X)
        theta_mle_norm = sqrt(sum(theta_mle*theta_mle))
        theta_js = (signcheck(1-((k-2)/(n*(theta_mle_norm*theta_mle_norm))))*theta_mle)
        risk_js = sum((mu - theta_js)*(mu - theta_js))
        return(risk_js)
}
computemlerisk<-function(X,mu){
        theta_mle=colMeans(X)
        risk_mle = sum((mu-theta_mle)^2)
        return(risk_mle)
}
n = 1000
k=100
js_risk = {}
mle_risk = {}
for (i in 1:100){
        mu=rep(0,i)
        val=rnorm((i*n),0,1)
        X=matrix(val,nrow=n,ncol=i)
        mle_val=computemlerisk(X,mu)
        js_val = computejsrisk(X,mu,n,i)
        mle_risk=c(mle_risk,mle_val)
        js_risk=c(js_risk,js_val)
}
xaxisvalues=1:100
result=data.frame(xaxisvalues,mle_risk,js_risk)
ggplot() + 
geom_line(data = result, aes(x = result$xaxisvalues, y = result$mle_risk, colour = "mle_risk")) +
geom_line(data = result, aes(x = result$xaxisvalues, y = result$js_risk, color = "js_risk")) +
xlab('Index') +
ylab('Risk Estimates') + 
labs(title="Comparison of James-Stein Estimator and MLE Estimator", x="K parameter theta", y="Risk values") + 
theme(plot.title = element_text(hjust = 0.5)) + 
scale_colour_manual("", breaks = c("mle_risk", "js_risk"),values = c("red", "green", "blue"))

        
        
        
        
        
        
        