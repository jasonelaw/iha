#'@rdname internal
`mindate` <-
function (x, julian = T) 
{
    mn <- index(x)[which.min(x)]
    if (julian) 
        mn <- as.POSIXlt(mn)$yday + 1
	mn
}
