`monotonic.segments` <-
function (x, diff = T) 
{
    if (!diff) 
        x <- diff(x)
    f <- rep("zero", length(x))
    f[x > 0] <- "increasing"
    f[x < 0] <- "decreasing"
    f.runs <- rle(f)
    i <- which(f.runs$values == "zero")
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
