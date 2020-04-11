

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix())
## This Function creates a matrix that can cache its inverse.
  
  
makeCacheMatrix <- function(x = matrix()) {
  inverse_matrix <- NULL
  set <- function(y){
    x <<- y
    inverse_matrix <<- NULL
  }
  get <- function() x
  
  set_inverse_matrix <- function(inverse) inverse_matrix <<- inverse
  get_inverse_matrix <- function() inverse_matrix
  
  list(set = set, get = get, set_inverse_matrix = set_inverse_matrix, get_inverse_matrix = get_inverse_matrix )

}


## This function computes the inverse we got from the matrix returned by makeCacheMatrix .
## If the inverse is already calcualted then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  inverse_matrix <- x$get_inverse_matrix()
  if(!is.null(inverse_matrix)) {
    message("Obtaining Cached Data")
    return(inverse_matrix)
  }
        data <- x$get()
        inverse_matrix <- solve(data, ...)
        x$set_inverse_matrix(inverse_matrix)
        inverse_matrix
}
