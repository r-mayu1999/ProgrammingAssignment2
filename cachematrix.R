## The functions makeCacheMatrix and cacheSolve are special objects used to cache the inverse of a matrix.

## This function is the input to the cacheSolve() function.
makeCacheMatrix <- function(x = matrix()) {

## This function sets the matrix
		set <- function(matrix) {
			x <<- matrix
			i <<- NULL
		}
## This function gets the matrix		
		get <- function() x

## This function sets the inverse matrix
		setinverse <- function(inverse) i <<- inverse

## This function gets the inverse matrix		
		getinverse <- function() i

## This function is a list returning the result		
		list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## The following function is written to compute the inverse of the "special" matrix returned by makeCacheMatrix above using cacheSolve.
## This function is the output to the makeCacheMatrix() function.
cacheSolve <- function(x, ...) {

## This function returns the matrix that is the inverse of 'x'	
	i <- x$getinverse()

## If the inverse, 'i' has already been calculated, it will be returned and skips the computation.
	if(!is.null(i)) {
			message("getting cached data")
			return(i)
	}

## If 'i' has not been calculated, it will get the matrix from the object and calculate the inverse.
	data <- x$get()
	i <- solve(data)

## This function sets the value of the inverse in the cache to the object using the setinverse function.	
	x$setinverse(i)

## The inverse is returned.	
	i
}