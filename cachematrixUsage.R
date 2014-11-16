# The following script demonstrates usage of makeCacheMatrix and
# cacheSolve functions

cacheMatrix <- makeCacheMatrix(matrix(1:4,2,2))
cacheSolve(cacheMatrix) # calculate inverse and store in cache
cacheSolve(cacheMatrix) # retrieve cached value
cacheMatrix$set(matrix(4:1,2,2)) # should invalidate cache
cacheSolve(cacheMatrix) # recalculate inverse and store in cache
cacheSolve(cacheMatrix) # retrieve cached value
