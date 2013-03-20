#'@rdname internal
`pulse.location` <-
function (x, XFUN = median) 
{
    tapply(x$lengths, x$values, FUN = XFUN)[c("low", "high")]
}
