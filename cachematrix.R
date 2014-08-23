#The following two functions are used to cache the inverse of a matrix.
	#The idea is to use "<<-" operator.It is a "super assignment" operator, which means that the assignment is done in the global environment, rather
# than to a variable that is within a function and therefore may only have local scope.
# using this operator and lexical scoping rules a cache can be created.In our case we need to cache a matrix.

	# makeCacheMatrix creates a list of function
	# 1. set the value of the matrix
	# 2. get the value of the matrix
	# 3. set the value of inverse of the matrix
	# 4. get the value of inverse of the matrix
	makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
	x <<- y
	inv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set=set, get=get, setinv=setinv, getinv=getinv)
	}


	# The following function returns the inverse of the matrix. It first checks if
	# the inverse has already been computed. If so, it gets the result and skips the
	# computation. If not, it computes the inverse, sets the value in the cache via
	# setinv function.

	# This function assumes that the matrix is always invertible.
	cacheSolve <- function(x, ...) {
	inv <- x$getinv()
	if(!is.null(inv)) {
	message("getting cached data.")
	return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinv(inv)
	inv
	} 
