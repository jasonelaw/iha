#'@rdname internal
`rezero.year` <-
function (x, month = 10, day = 1, year.prefix = "WY") 
{
    ye <- years(range(x)) + c(-1, 1)
    range <- ISOdatetime(ye, month, day, 0, 0, 0)
    breaks <- seq(range[1], range[2], by = "year")
    ny <- cut(x, breaks, include.lowest = TRUE, right = FALSE)
    nylab <- as.numeric(substr(levels(ny), 1, 4)) + 1
    nylab <- paste(year.prefix, nylab, sep = "")
    levels(ny) <- nylab
    ny <- ny[, drop = T]
    return(ny)
}
