## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# the x parameter takes in a matrix, or if its another datatype coerces into a matrix.
# set function used for setting value of matrix.
# get function used for getting value of matrix.
# getinverse function used for getting inverse of matrix.
# setinverse function used for setting inverse of matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
#checks whether there is cached data stored in m, if there is cached data is returned.  
#if there is no cached data in m, then solve function is used to find inverse of matrix
#and stored in m
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}
