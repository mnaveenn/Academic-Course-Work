category4<-read.csv("Category 4.csv")
summary(category4)
category5<-read.csv("Category 5.csv")
summary(category5)
plot(category4[,5], type = "l", col = "red",ylim = c(900,975),xlim=c(1,20),yaxt = 'n',ylab = 'Windspeed/Pressure',xlab = ' Hurricane Index',lty = 2)
par(new = TRUE)
plot(category4[,4],type = "l", col = "green",ylim = c(200,275),xlim=c(1,20),yaxt = 'n',ylab="",xlab = "",pch=2,lty = 1, main = "Comparison of Windspeed and Pressure")
legend(x="topright",c("windspeed","pressure"),col=c("red","green"),lty = c(1,2),cex = 0.6)
groupedcategory4<-read.csv("Grouped Category 4.csv")
groupedcategory5<-read.csv("Grouped Category 5.csv")

p<-ggplot(data=groupedcategory4, aes(x=groupedcategory4[,1], y=groupedcategory4[,2])) +
        geom_bar(stat="identity")+ggtitle("Category 4 Hurricanes over the years")+labs(y="Number of Hurricanes", x = "Years") + theme(plot.title = element_text(hjust = 0.5))+theme(text = element_text(size=20),
                                                                                                                                                                                    axis.text.x = element_text(angle=90))
p
q<-ggplot(data=groupedcategory5, aes(x=groupedcategory5[,1], y=groupedcategory5[,2])) +
        geom_bar(stat="identity")+ggtitle("Category 5 Hurricanes over the years")+labs(y="Number of Hurricanes", x = "Years") + theme(plot.title = element_text(hjust = 0.5))
q

myqqplot<-function(x,dist,binom.n=3)
{
        n1<-length(x)
        p1<-c(1:n1)/(n1+1)
        if(dist=="pois")
        {
                q<-qpois(p1,mean(x))
        }
        if(dist=="binom")
        {
                q<-qbinom(p1,n1,mean(x/binom.n))
        }
        if(dist=="nbinom")
        {
                q<-qnbinom(p1,n1,mean(x/binom.n))       
        }
        plot(c(0,sort(x)),c(0,q),xlab="data",ylab="theoretical quantile",main=dist)
}

hurricanes<-read.csv("hurricanes.csv")




