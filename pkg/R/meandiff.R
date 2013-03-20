#'@rdname internal
`meandiff` <-
function (x, na.rm = T) 
{
    d <- diff(x)
    ind <- d > 0
    c(median(d[ind], na.rm = na.rm), median(d[!ind], na.rm = na.rm), 
        length(monotonic.segments(d)$values) - 1)
}
