`rle.start` <-
function (x) 
{
    pl <- cumsum(x$length)
    l <- length(pl)
    pl <- rep(1, l) + pl
    start <- c(1, pl[-l])
    return(start)
}
