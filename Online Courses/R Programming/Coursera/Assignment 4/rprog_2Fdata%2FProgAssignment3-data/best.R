best <- function(state, outcome) 
        {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        if (!match(state, unique(dat[, 7]))) 
        {
                stop("invalid state")
        }
        if (outcome == "heart attack")
        {
                col = 11
        }
        else if (outcome == "heart failure")
        {
                col = 17
        }
        else if (outcome == "pneumonia")
        {
                col = 23
        }
        else 
        {
                print("invalid outcome")
        }
        ## Return hospital name in that state with lowest 30-day death rate
        df = dat[dat$State == state, c(2, col)]
        df[(df[,2]==min(df[, 2])), 1]
}