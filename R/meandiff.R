#'@rdname internal
`meandiff` <-
function (x, FUN = median, na.rm = T) 
{
    d <- diff(x)
    ind <- d > 0
    c(FUN(d[d > 0], na.rm = na.rm), FUN(d[d < 0], na.rm = na.rm), 
        length(monotonic.segments(d)$values) - 1)
}
