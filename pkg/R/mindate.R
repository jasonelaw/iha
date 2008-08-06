`mindate` <-
function (x, julian = T) 
{
    d <- index(x)[which.min(x)]
    if (julian) 
        as.POSIXlt(d)$yday + 1
}
