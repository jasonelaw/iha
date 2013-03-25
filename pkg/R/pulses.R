#'@rdname internal
pulses <- function(x, q){
  runs <- findInterval(x, q, rightmost.closed = T)
  runs.length        <- rle(runs)
  runs.length$values <- as.factor(c("low", "med", "high")[runs.length$values + 1])
  return(runs.length)
}

#'Calculate change rate for a vector
#'
#'Calculate change rate for a vector
#'@param x a vector
#'@export
change.rate <- function(x){
  dx <- diff(x)
  dx / x[-length(x)]
}
