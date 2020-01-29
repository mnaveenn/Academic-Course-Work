data = read.csv("kmeans.csv")
# Sample data    
set.seed(200)


# Kmeans function
kclus <- function(data, nclus) {
        
        # start with random cluster centers
        acen <- runif(n = nclus, min = min(data[,1]), max = max(data[,1]))   
        bcen <- runif(n = nclus, min = min(data[,2]), max = max(data[,2]))
        ccen <- runif(n = nclus, min = min(data[,3]), max = max(data[,3]))
        dcen <- runif(n = nclus, min = min(data[,4]), max = max(data[,4]))
        ecen <- runif(n = nclus, min = min(data[,5]), max = max(data[,5]))
        
        # data points and cluster assignment in "data"
        # cluster coordinates in "clus"
        data <- data.frame(aval = data[,1], bval = data[,2], cval = data[,3], dval = data[,4], eval = data[,5], clus = NA)
        clus <- data.frame(name = 1:nclus, acen = acen, bcen = bcen, ccen = ccen, dcen = dcen, ecen = ecen)
        
        finish <- FALSE
        l<-dim(data)
        while(finish == FALSE) {
                
                # assign cluster with minimum distance to each data point
                for(i in 1:l[1]) {
                        dist <- sqrt((data[i,1]-clus$acen)^2 + (data[i,2]-clus$bcen)^2 + (data[i,3]-clus$ccen)^2 + (data[i,4]-clus$dcen)^2 + (data[i,5]-clus$ecen)^2)
                        data$clus[i] <- which.min(dist)
                }
                
                acen_old <- clus$acen
                bcen_old <- clus$bcen
                ccen_old <- clus$ccen
                dcen_old <- clus$dcen
                ecen_old <- clus$ecen
                
                # calculate new cluster centers
                for(i in 1:nclus) {
                        clus[i,2] <- mean(subset(data$aval, data$clus == i))
                        clus[i,3] <- mean(subset(data$bval, data$clus == i))
                        clus[i,4] <- mean(subset(data$cval, data$clus == i))
                        clus[i,5] <- mean(subset(data$dval, data$clus == i))
                        clus[i,6] <- mean(subset(data$eval, data$clus == i))
                }
                
                # stop the loop if there is no change in cluster coordinates
                if(identical(acen_old, clus$acen) & identical(bcen_old, clus$bcen) & identical(ccen_old, clus$ccen) & identical(dcen_old, clus$dcen) & identical(ecen_old, clus$ecen)) finish <- TRUE
        }
        output<-NULL
        output$data<-data
        output$cluster<-clus
        return(output)
}

# apply kmeans function to sample data
output <- kclus(data, 3)

# plot the result
ggplot(output$data, aes(bval, aval, color = as.factor(clus))) + geom_point()
X <- output$data[,1:5]
y <- output$data[,6]
y_col <- c('#F8766D', '#00BA38', '#619CFF')
print(cov(output$cluster))
pairs(X, lower.panel = NULL, col = y_col[y])
summary(cov(output$cluster))
