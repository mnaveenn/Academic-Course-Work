matrix.2ndorder.make<-function(x, only.quad=T){
        x0<-x
        dimn<-dimnames(x)[[2]] #extract the names of the variables
        num.col<-length(x[1,]) # how many columns
        for(i in 1:num.col){
                # if we are doing all 2nd order
                if(!only.quad){
                        for(j in i:num.col){
                                x0<-cbind(x0,x[,i]*x[,j])
                                dimn<-c(dimn,paste(dimn[i],dimn[j],sep=""))
                                #create interaction dimnames
                                
                        }
                }
                else{
                        #in here only if doing only squared terms
                        x0<-cbind(x0,x[,i]*x[,i])
                        dimn<-c(dimn,paste(dimn[i],"2",sep="")) # squared dimmension names
                }
        }
        dimnames(x0)[[2]]<-dimn
        x0
}


Fun.in.Tstats<-function(Bx=.1,By=1,n=50){
        x1<-rnorm(n)
        x2<-(x1*Bx+rnorm(n))
        x2<-x2/(sd(x2))
        y<-x1+x2+rnorm(n)+1
        par(mfrow=c(2,2))
        plot(x1,x2,main=paste("cor=",cor(x1,x2)))
        lstr<-lsfit(cbind(x1,x2),y)
        print(lstr$coef)
        yhat<-lstr$coef[1]+cbind(x1,x2)%*%c(lstr$coef[-1])
        mse<-sum(lstr$resid^2)/(length(y)-3)
        plot(yhat,y)
        plot(yhat,lstr$resid)
        ls.print((lstr))
        Hat=hat(cbind(x1,x2))
        xmat<-cbind(x1,x2,1)
        xmat1<-cbind(x1,x2)
        xtxinv<-solve(t(xmat)%*%xmat)
        
        list(Hat=Hat,xtx=t(xmat)%*%xmat,covBnos=xtxinv,mse=mse,cor.xmat=cor(xmat1),corinv=solve(cor(xmat1)),eigen=eigen(cor(xmat1)))    
}
