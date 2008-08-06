`extrema` <-
function (x, period, mean.window, ...) 
{
    m <- rollmean(x, mean.window, na.pad = T)
    sm <- split(as.numeric(m), f = period)
    res <- sapply(sm, range, na.rm = T, ...)
    return(res)
}
