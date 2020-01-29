##This function is used to create a matrix
##Once the matrix is created it is saved in the current environment as well as a different environment 
##The inverse is stored as null in the cache 
##Once the inverse is computed using cacheSolve()
##The inverse is stored in the cache 
##If the inverse is to be computed again for the same matrix, then the inverse is obtained from the cache environment is looked up.
makeCacheMatrix <- function(x = matrix()) 
{
        m <- NULL
        set <- function(y) 
        {
                x <<- y
                m <<- NULL ##initial value of the inverse
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse ##this function is used to set the inverse of the matrix in a different environment
        getinverse <- function() m 
        ##this gets the value of inverse from cached data
        ##returns a list with 4 functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) 
}
## The cacheSolve() function is used to compute the inverse of a matrix and store the inverse in the cache environmet
##The function checks if the inverse of the matrix is already computed
##If the inverse is already computed then the result is taken from the cache environment
##If the result is not available then the inverse is computes and stored in the cache environment for future use.
cacheSolve <- function(x, ...) { ##here x is an object of type makeCacheMatrix 
        m <- x$getinverse()
        if(!is.null(m)) 
        { 
                ## if the inverse is available in cache then we dont have to compute the inverse, we can use the getinverse() function of x 
                message("getting cached data")
                return(m)
        }
        ## If inverse is not available in cache then we have to calculate the inverse and save the same in cache for future use
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}