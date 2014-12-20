## Put comments here that give an overall description of what your
## functions do
## Initial commit to check the commit process
## Second line
## Write a short comment describing this function

## This function creates a special matrix object that can cache its inverse
## This function is basically a list containing a function which does one of
## the following
## set - Sets the value of the vector
## get - Gets the value of the vector
## setInverse - Sets the value of the inverse 
## getInverse - gets the inverse from the cache

## This function takes an input argument as a matrix
## This returns a matrix which is the inverse of the give matrix
## If the matrix has not changed and if inverse is stored in the cache it retrieves it from the cache
## Otherwise (if inverse is not available in the cache or if the matrix has changed it calculates
## the inverse of the given matrix using the Solve method
## It updates the cache by calling the appropriate method to store the inverse



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


## This function takes an input argument as a matrix
## This returns a matrix which is the inverse of the give matrix
## If the matrix has not changed and if inverse is stored in the cache it retrieves it from the cache
## Otherwise (if inverse is not available in the cache or if the matrix has changed it calculates
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
  
makevector <- function(x = numeric()) {
  memory <- NULL
  set <- function (y) {
    ## This stores the matrix
    x <<- y
    memory <<- null
  }
  ## This returns the matrix
  get <- function() x
  
  ## This stores the inverse in the cache
  setmean<- function ( mean)
    memory <<- mean
  
  ## This function gets the inverse from the cache
  getmean <- function() memory
  list (set=set, get=get , setmean = setmean, getmean = getmean)
  
}


## This function takes an input argument as a matrix
## This returns a matrix which is the inverse of the give matrix
## If the matrix has not changed and if inverse is stored in the cache it retrieves it from the cache
## Otherwise (if inverse is not available in the cache or if the matrix has changed it calculates
## the inverse of the given matrix using the Solve method
## It updates the cache by calling the appropriate method to store the inverse


cachemean <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  memory <- x$getmean ()
  if (!is.null(memory)) {
    message("getting cached data")
    return (memory)
  }
  ## It is not in cache, Compute the inverse, by calling the solve fucntion
  ## and store the value by calling the fucntion setinverse
  
  data<- x$get()
  memory <- mean(data, ...)
  x$setmean( memory)
  memory
  
  
  
}


