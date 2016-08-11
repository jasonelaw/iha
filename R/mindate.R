#'@rdname internal
`mindate` <-
function (x, julian = T) 
{
  mx <- index(x)[which.min(x)]
  if (julian) 
    mx <- (as.POSIXlt(mx, tz = tz(mx))$yday + 1)
  return(mx)
}
