## Put comments here that give an overall description of what your
## functions do

# The code is based on the example given on the webpage for a numeric vector. Using that code as a template, I replaced the references to a vector with that of a matrix, and replaced references to getting the mean with getting the matrix inverse. This code is designed to check if the inverse of a matrix is already calculated. If it is not already calculated and in the cache, then the inverse is calculated. Otherwise, the inverse is calculated.

## Write a short comment describing this function

# This function returns a list which contains functions, holding a cached value for the matrix inverse, and a function set get and set the matrix inverse if the inverse is not already cached.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<-y
    m <<-NULL
  }

  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)


}


## Write a short comment describing this function

#This code checks to see if the matrix inverse is calculated. If so, it returns the value of the inverse which is cached. Otherwise, it calculates the inverse using the solve() function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {

    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inverse(data, ...) solve(x)  # Get the matrix inverse here.
  x$setinverse(m)
  m


}
