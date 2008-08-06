`group5` <-
function (x, yr = NULL) 
{
    if (is.null(yr)) 
        yr <- water.year(index(x))
    sx <- split(as.numeric(x), yr)
    res <- sapply(sx, FUN = meandiff)
    dimnames(res)[[1]] <- c("Rise rate", "Fall rate", "Reversals")
    return(t(res))
}
