#'Return a string giving the water year for a date
#'
#'Returns a string specifying the water year (\code{'WY2010'}) for a date
#'@param x a POSIXt object
`water.year` <-
function (x) 
{
    ye <- years(range(x)) + c(-1, 1)
    range <- ISOdatetime(ye, 10, 1, 0, 0, 0)
    breaks <- seq(range[1], range[2], by = "year")
    wy <- cut(x, breaks)
    wylab <- as.numeric(substr(levels(wy), 1, 4)) + 1
    wylab <- paste("WY", wylab, sep = "")
    levels(wy) <- wylab
    wy <- wy[, drop = T]
    return(wy)
}
