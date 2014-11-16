## Pair of functions providing the mechanism for caching the inverse
## of an invertible matrix

## Creates an object with functions to store and retrieve
## a matrix and its cached inverse
## If the underlying matrix data is changed, the cached inverse
makeCacheMatrix <- function(x = matrix()) {
  # initialise with a NULL cached inverse
  i <- NULL
  # define a function to set the matrix data
  set <- function(y) {
    x <<- y
    # when matrix data is reset, the inverse should be NULLified
    i <<- NULL
  }
  # define a function to retrieve the matrix data
  get <- function() x
  # define a function to cache the inverse
  setinverse <- function(inverse) i <<- inverse
  # define a function toe retrieve the cached inverse
  getinverse <- function() i
  
  # return a list of functions
  list(
    set = set,
    get = get,
    setinverse=setinverse,
    getinverse=getinverse)
}


## Either returns the pre-stored inverse of a cacheMatrix object (created
## by the makeCacheMatrix function); or, if no cached inverse is available,
## computes the inverse and returns it, after storing it in the cacheMatrix
## object
cacheSolve <- function(x, ...) {
  # check to see if x contains a cached inverse
  i <- x$getinverse()
  # it does, then use it
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  # if it does not...
  # first get the underlying matrix
  m <- x$get()
  # compute the inverse
  i <- solve(m)
  # store the inverse in the cache
  x$setinverse(i)
  # return the inverse
  i
}
