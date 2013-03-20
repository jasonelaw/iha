#'@rdname internal
`years` <-
function (x, abbreviate = FALSE) 
{
    as.numeric(format(x, "%Y"))
}
