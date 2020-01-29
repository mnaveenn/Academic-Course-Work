makeCacheMatrix <- function(x = matrix()) {
        +    cached_inverse <- NULL      # variable in which the cached inverse is
        +                                # stored. NULL if not calculated yet.
                
                -}
+    # function to set the matrix represented by the object to `y`. The
        +    # cached_inverse is set to NULL to force the inverse to be recalculated.
        +    # Note that the <<- assignment is used, to assign the variables in
        +    # the object's environment.
        +    set <- function(y) {
                +        x <<- y
                +        cached_inverse <<- NULL
                +    }
        
        +    # function to retrieve the matrix that the object represents    
                +    get <- function() x
                +
                        +    # function to set the cached value for the inverse 
                        +    setinverse <- function(inverse) cached_inverse <<- inverse
                        +    
                                +    # function to retrieve the cached value of the inverse
                                +    getinverse <- function() cached_inverse
                                +    
                                        +    # constructs the CacheMatrix object as a list of above closures
                                        +    list(set = set,
                                                  +         get = get,
                                                  +         setinverse = setinverse,
                                                  +         getinverse = getinverse)
                                +}

-## Write a short comment describing this function
        
        +#
        +# The `cacheSolve` function returns the inverse of the matrix represented by
        +# the CacheMatrix object in its argument.
        +#
        +# If the inverse was already calculated, it just returns it, otherwise the
        +# inverse is calculated, cached into the CacheMatrix object, and returned.
        +#
        +# Usage: cacheSolve(x, ...)
        +#
        +# Arguments: x   a CacheMatrix, constructed by makeCacheMatrix()
        +#            ... further arguments, passed to the function solve()
        +#                (e.g. `tol` to set the tolerance for detecting linear
        +#                dependencies in the columns of the matrix)
        +#
        +# Notes: - We assume that the matrix represented by x is invertible.
        +#        - The inverse is calculated using the base::solve() function.
        +#
        cacheSolve <- function(x, ...) {
                -        ## Return a matrix that is the inverse of 'x'
                        +    inv <- x$getinverse()       # retrieve the cached inverse from x
                        +    if (is.null(inv)) {
                                +        # the inverse is not in the cache
                                        +        m <- x$get()            # retrieve the original matrix
                                        +        inv <- solve(m, ...)    # calculate its inverse
                                        +        x$setinverse(inv)       # cache the inverse into x
                                        +    } else {
                                                +        # the inverse was already calculated and cached
                                                        +        message("getting cached data")
                                                +    }
                        +    inv                         # return a matrix that is the inverse of 'x'
        }