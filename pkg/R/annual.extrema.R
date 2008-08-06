`annual.extrema` <-
function (x, yr = NULL, ...) 
{
    mean.window <- c(1, 3, 7, 30, 90)
    if (is.null(yr)) 
        yr <- water.year(index(x))
    nr <- 2 * length(mean.window)
    years <- unique(yr)
    nc <- length(years)
    res <- matrix(NA, ncol = nc, nrow = nr)
    for (i in 1:length(mean.window)) {
        res[2 * i + c(-1, 0), ] <- extrema(as.numeric(x), yr, 
            mean.window[i])
    }
    dimnames(res) <- list(as.vector(outer(c("Day Min", "Day Max"), 
        mean.window, function(x, y) paste(y, x))), years)
    return(t(res))
}
