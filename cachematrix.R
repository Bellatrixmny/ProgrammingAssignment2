## Put comments here that give an overall description of what your
## functions do
# 'makeCacheMatrix' creates a special "matrix" object that can cache its inverse.

# 'cacheSolve' computes the inverse of the special "matrix" returned by 'makeCacheMatrix' above. 
# If the inverse has already been calculated (and the matrix has not changed), then the 'cachesolve' should retrieve the inverse from the cache.

## Write a short comment describing this function
## makeCacheMatrix creates a 'vector' containing a function to 
#set the value of the matrix, 
#get the value of the matrix
#set the value of the inverse
#get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) i <<- inverse
  getinv <- function() i
  list(set = set, get = get, setinv = setinv, getinv = getinv)
  
}


## Write a short comment describing this function
# the following function calculates the inverse of the special "vector" created with the above function.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  if(!is.null(i)) {
      message("getting cached data")
      return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
