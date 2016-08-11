#'Internal functions in IHA
#'
#'These are internal, undocumented (for now) functions in the IHA package
#'@rdname internal
`monotonic.segments` <-
function (x, diff = T) 
{
    if (!diff) 
        x <- diff(x)
    f <- rep(1, length(x))
    f[x > 0] <- 2
    f[x < 0] <- 0
    f.runs <- rle(f)
    i <- which(f.runs$values == 1)
    if (identical(i[1], as.integer(1))) {
        f.runs$values[1] <- f.runs$values[2]
        i <- i[-1]
    }
    if (length(i) > 0) 
        f.runs$values[i] <- f.runs$values[i - 1]
    f <- inverse.rle(f.runs)
    f.runs <- rle(f)
    return(f.runs)
}
