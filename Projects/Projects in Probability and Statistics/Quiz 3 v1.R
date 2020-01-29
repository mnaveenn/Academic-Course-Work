mysprt<-function(val=0.7)
{
        alpha0=0.01
        alpha1=0.01
        A=log(alpha1/(1-alpha0))
        B=log((1-alpha1)/alpha0)
        print(A)
        print(B)
        S=0
        p=0.55
        n=0
        y=NULL
        while(1)
        {
                x=rbinom(1,1,val)
                y=c(y,x)
                n=n+1
                if(x==0)
                {
                        S=S+log(1-p)-log(p)
                }
                if(x==1)
                {
                        S=S+log(p)-log(1-p)
                }
                if(S>=B)
                {
                        print("Accept H1 (p>=0.55)")
                        break
                }
                if(S<=A)
                {
                        print("Accept H0 (p<=0.45)")
                        break
                }
        }
        print(n)
        print(y)
}


