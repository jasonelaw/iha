#'Calculate the group 5 IHA parameters.
#'
#'The group 5 IHA parameters measure the rate and frequency of water condition
#'changes.
#'

#'@param x A zoo object containing the flow series
#'@param year the type of year factor to be used, \code{yr = 'water'} or \code{yr = 'calendar'}
#'for water years and calendar years respectively
#'@return a matrix of group 5 parameters
#'@author jason.e.law@@gmail.com
#'@references \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
#'@export
#'@examples
#'data(bullrun)
#'group5(bullrun, 'water')
`group5` <- function (x, year = c('water', 'calendar')){
  stopifnot(is.zoo(x), inherits(index(x), 'Date') | inherits(index(x), 'POSIXt'))
  year <- match.arg(year)
  yr <- switch(year,
               water = water.year(index(x)),
               calendar = year(index(x)))
  sx <- split(as.numeric(x), yr)
  res <- sapply(sx, FUN = meandiff)
  dimnames(res)[[1]] <- c("Rise rate", "Fall rate", "Reversals")
  return(t(res))
}
