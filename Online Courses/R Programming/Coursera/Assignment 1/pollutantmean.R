pollutantmean<-function(directory,pollutant="sulfate",id=1:332)
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
        if(pollutant=="sulfate")
        {
                j=2
        }
        else if(pollutant=="nitrate")
        {
                j=3
        }
        bad<-is.na(data[,j])
        data1<-data[!bad,]
        m[k]<-sum(data1[,j])
        n[k]<-nrow(data1)
        k<-k+1
        }
        avg<-sum(m)/sum(n)
        avg
}