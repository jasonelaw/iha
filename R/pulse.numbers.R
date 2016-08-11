#'@rdname internal
`pulse.numbers` <-
function (x) 
{
    summary(x)[c("low", "high")]
}
