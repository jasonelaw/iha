`maxdate` <-
function (x, julian = T) 
{
    d <- index(x)[which.max(x)]
    if (julian) 
        as.POSIXlt(d)$yday + 1
}
