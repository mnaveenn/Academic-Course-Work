## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL ##initial value of the inverse
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse ##this function is used to set the inverse of the matrix in a different environment
        getinverse <- function() m ##this gets the value of inverse from cached data
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) ##returns a list with 4 functions

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##here x is an object of type makeCacheMatrix 
        m <- x$getinverse()
        if(!is.null(m)) { ## if the inverse is available in cache then we dont have to compute the inverse, we can use the getinverse() function of x 
                message("getting cached data")
                return(m)
        }## If inverse is not available in cache then we have to calculate the inverse and save the same in cache for future use
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
