v1=c(1e-5*runif(100),runif(900))
Q=0.05
o1<-order(v1)
pvec<-v1[o1]
m<-length(v1)
qline<-Q*c(1:m)/m
plot(c(c(1:m),c(1:m)),c(qline,pvec),type ="n",xlab ="ordering",ylab="pval")
lines(c(1:m),qline)
points(c(1:m),pvec)
dv<-pvec-qline
I1<-(dv<0)
pmax<-max(pvec[I1])
I2<-pvec<=pmax
points(c(1:m)[I2],pvec[I2],col="red")
o1[I2]