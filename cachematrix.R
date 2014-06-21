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

## usage:
##  <var><- makeCacheMatrix(<squad matrix>)
## test:
##    source("cachematrix.R")
##	m1 <- makeCacheMatrix(matrix(c(1:4), nrow=2, ncol=2))
##    m1$get() 		# get the value
##    m1$getinv()		#get the value of the cache
##	cacheSolve(m1)	# get the invert 
##    m1$getinv()       # check if cache heve been updated
##    m0 <- matrix(c(1, 0, 2,0 , 0, 0, 1, 0, 2), nrow = 3,  ncol = 3) # matrix non invertilble
##    det(m0)		# check if determinant is zero
##    cacheSolve(m0)	# check the error.

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
        ######################################
        ##   fonction checkinv
        ######################################
        ##  handle of exception
	  checkinv<- function(x,trace=FALSE){
        # return bolean TRUE if matrix x can be inverted
        # print error message when trace set to TRUE
	  # the lazy evaluation of booleam in if statement avoid the usage of imbrication of If statemnt
        
		  canInv <- TRUE
		  if (!is.matrix(x)){
                 canInv <- FALSE
    		     if (trace) message("Error  : the parameter must be a matrix")
              }
  		  if (length( dim(x)) !=2 ){
                 canInv <- FALSE
    		     if (trace) message("Error  : the matrix must have a dimension of 2")
              }
              if (length( dim(x)) ==2 && (dim(x)[1] != 2 || dim(x)[2] !=2) ){
                 canInv <- FALSE
    		     if (trace) message("Error  : the matrix must have a the same number of element in each dimension")
              }
              if (mode(x)!="numeric"){
                 canInv <- FALSE
    		     if (trace) message("Error  : the element of the  matrix must be numerical")
              }
              if (det(x) == 0){
                 canInv <- FALSE
    		     if (trace)	message("Error  : matrix can not be inverted, its determinant is null")
              }
	        canInv
	  }
        ###########################################
        ## start of Body
        cache_inv <- x$getinv()		# access the cache
        if(!is.null(cache_inv)) {
	          # data are in the cache, no need de calculate
                message("getting data from Cache")
        } else {
 		   # no data in the cache, calculation required
               data <- x$get()
               if (checkinv(data, TRUE)){
                       # case cache is null, then populate the cache
                       cache_inv <- solve(data, ...)
                       x$setinv(cache_inv)
               }
	  }   # of if null
        # return the value of the cache
        cache_inv

}
