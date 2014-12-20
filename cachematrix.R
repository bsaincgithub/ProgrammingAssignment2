## These two functions provides a cache storage to store a matrix and get its inverse
## makeCacheMatrix - THis takes a matrix as an input and returns a list of functions
## Second function cacheSolve() - THis can return the inverse either by computing or
## from cache.

## makeCacheMatrix 

## This function creates a special matrix object that can cache its inverse
## This function is basically a list containing a function which does one of
## the following

## set - Sets the value of the vector
## get - Gets the value of the vector
## setInverse - Sets the value of the inverse 
## getInverse - gets the inverse from the cache


makeCacheMatrix <- function(x = matrix()) {
  memory <- NULL
  set <- function (y) {
## This stores the matrix
  x <<- y
  memory <<- null
  }
## This returns the matrix
  get <- function() x

## This stores the inverse in the cache
  setinverse <- function ( inverse)
  memory <<- inverse

## This function gets the inverse from the cache
  getinverse <- function() memory
  list (set=set, get=get , setinverse = setinverse, getinverse = getinverse)

}


## This function takes an input argument 
## This returns a matrix which is the inverse of the matix stored
## If the matrix has not changed and if inverse is stored in the cache it retrieves it from the cache
## Otherwise (if inverse is not available in the cache it calculates
## the inverse of the given matrix using the Solve method
## It updates the cache by calling the appropriate method to store the inverse


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  memory <- x$getinverse ()
  if (!is.null(memory)) {
    message("getting cached data")
    return (memory)
  }
## It is not in cache, Compute the inverse, by calling the solve fucntion
## and store the value by calling the fucntion setinverse

  data<- x$get()
  memory <- solve(data, ...)
  x$setinverse( memory)
  memory
}



