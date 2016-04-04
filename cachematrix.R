## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix stores a matrix X 
## cacheSolve provide the inverse of a matrix
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(Y){
        X <<- Y
        inverse <<- NULL
    }
    get <- function() X
    setinverse <- function(Inverse) inverse <<- Inverse
    getinverse <- function() inverse
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## Write a short comment describing this function
## cacheSolve uses bodcor
## Pay attention, this function will attempt to load bodcor library and if it cannot, it will attempt the library installation

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    if(require("bodcor")){
        print("bodcor is loaded correctly")
    } else {
        print("trying to bodcor installation")
        install.packages("bodcor")
        if(require(bodcor)){
            print("bodcor is installed and loaded")
        } else {
            stop("can't install bodcor")
        }
    }
    inverse <- X$getinverse()
    if(!is.null(inverse)){
        message("Find matrix is in the memory")
        return(inverse)
    }
    message(" the inverse is not in the memory so the inverse (if there is one) will have to be computed")
    data <- X$get()
    inverse <- pseudoinverse(data, ...)
    X$setinverse(inverse)
    inverse
}