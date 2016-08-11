#'Calculate the date of a extreme value for a zoo series
#'
#'These functions calculate the date (or more specifically, the value of the index
#'of a zoo object) of an extreme value for a zoo series.
#'@param x a zoo object
#'@return the value of the index for the min, max, or range
#'@importFrom zoo coredata index
#'@export
#'@examples
#'x <- zoo(1:10)
#'which.min.zoo(x)
#'which.max.zoo(x)
#'which.range.zoo(x)
which.min.zoo <- function(x) {
    index(x)[which.min(coredata(x))]
}

#'@rdname which.min.zoo
#'@importFrom zoo coredata index
#'@export
which.max.zoo <- function(x){
  index(x)[which.max(coredata(x))]
}

#'@rdname which.min.zoo
#'@export
which.range.zoo <- function(x){
  c(which.min.zoo(x), which.max.zoo(x))
}
