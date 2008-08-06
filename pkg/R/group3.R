`group3` <-
function (x, yr = NULL) 
{
    if (is.null(yr)) 
        yr <- water.year(index(x))
    sx <- split(x, yr)
    res <- sapply(sx, function(x) c(mindate(x), maxdate(x)))
    dimnames(res)[[1]] <- c("Min", "Max")
    return(t(res))
}
