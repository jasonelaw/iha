#'@rdname internal
`maxdate` <-
function (x, julian = T) 
{
    mx <- index(x)[which.max(x)]
    if (julian) 
        mx <- as.POSIXlt(mx)$yday + 1
	mx
}
