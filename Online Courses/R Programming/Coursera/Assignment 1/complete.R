complete<-function(directory,id=1:332)
{
        #old.dir<-getwd()
        #my.dir<-c(old.dir,directory)
        #new.dir<-paste(my.dir, collapse="/")
        #setwd(new.dir)
        #getwd()
        k<-length(id)
        
        m<-1:k
        n<-1:k
        k<-1
        for(i in id)
        {
                if(i<10)
                {
                        i1<-c("00",as.character(i),".csv")
                }
                else if(i<100 & i>=10)
                {
                        i1<-c("0",as.character(i),".csv")
                }
                else
                {
                        i1<-c(as.character(i),".csv")
                }
                myfile<-paste(i1,collapse="")
                con<-file(myfile,"r")
                data<-read.csv(con)
                close(con)
                bad<-is.na(data[,2])|is.na(data[,3])
                data1<-data[!bad,]
                n[k]<-nrow(data1)
                k<-k+1
        }
x<-data.frame(id=id,nobs=n)
x
}