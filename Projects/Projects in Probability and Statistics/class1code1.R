monte.hall<-function(N,n=3){
        winswitch<-NULL
        winstay<-NULL
        for(i in 1:N){
                true.door<-sample(n,n)
                print (true.door)
                choice.door<-sample(n,1)
                print (choice.door)
                Mdoor<-sample(true.door,1)
                if(choice.door==true.door[1]){
                        winswitch<-c(winswitch,0)
                        winstay<-c(winstay,1)
                }
                else{
                        winswitch<-c(winswitch,1/(n-2))
                        winstay<-c(winstay,0)
                }}
        m1<-cbind(winswitch,winstay)
        apply(m1,2,sum)/N
}