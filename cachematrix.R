#################################################
##
##      function :makeCacheMatrix
##	  function:cacheSolve
##
################################################
##
##function :makeCacheMatrix
## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to 
## 1.set the value of the vector
## 2.get the value of the vector
## 3.set the value of the invert
## 4.get the value of the invert


##function:cacheSolve
##calculates the mean of the special "matrix" 
## created with the above function. 
## However, it first checks to see if the inverted matrix has already been calculated. 
## If so, it gets the inverted (R function solve) from the cache and skips the computation. 
## Otherwise, check if the matrix can be inverted and calculates the inverted (R function solve)  of the data and sets the value of the inverted (R function solve)  in the cache via the setinvert function
##  For example, if X is a square invertible matrix, 
##     then solve(X) returns its inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
