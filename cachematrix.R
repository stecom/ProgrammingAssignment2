#################################################
##
##      function :makeCacheMatrix
##	  function :cacheSolve
##
################################################
##
##function :  makeCacheMatrix
## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to 
## 1.set the value of the vector
## 2.get the value of the vector
## 3.set the value of the invert
## 4.get the value of the invert
## it contains the object with its accessors method

##function : cacheSolve
## contains the logic the manage the special Natrix
##calculates the mean of the special "matrix" 
## created with the above function. 
## However, it first checks to see if the inverted matrix has already been calculated. 
## If so, it gets the inverted (R function solve) from the cache and skips the computation. 
## Otherwise, check if the matrix can be inverted and calculates the inverted (R function solve)  of the data and sets the value of the inverted (R function solve)  in the cache via the setinvert function
##  For example, if X is a square invertible matrix, 
##     then solve(X) returns its inverse



makeCacheMatrix <- function(x = matrix()) {
        ## definition of the cache
        cache_inv  <- NULL		# initialisation  of the cache

        ## definition of the methods of this special Matrix
        set <- function(y) {
			## creation of the special "matrix" (constructor)
                  x <<- y  			# set the data by overwriting
                  cache_inv  <<- NULL	# erase cache

        }
        get <- function() x					# return the object
        setinv <- function(inv) cache_inv <<- inv 	# set the cache
        getinv <- function() cache_inv			# return the cache
        list(set = set, get = get,				# return the object with its methods
             setinv = setinv,
             getinv = getinv)
}




cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
