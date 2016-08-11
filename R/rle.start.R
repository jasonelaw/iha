#'@rdname internal
`rle.start` <- function (x){
  pl <- cumsum(c(1, x$length))
  start <- pl[-length(pl)]
  return(start)
}
#'@rdname internal
`rle.end` <- function(x){
  end <- cumsum(x$length)
  return(end)
}
