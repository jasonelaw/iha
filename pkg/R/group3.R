#'Calculate the group 3 IHA parameters.
#'
#'The group 3 IHA parameters measure the timing of annual extreme water conditions
#'
#'@param x A zoo object containing the flow series
#'@param yr the type of year factor to be used, \code{yr = 'water'} or \code{yr = 'calendar'}
#'for water years and calendar years respectively
#'@return a matrix of the group 3 parameters
#'@author jason.e.law@@gmail.com
#'@references \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
#'@export
#'@examples
#'data(willamette)
#'group3(willamette, 'water')
#'
`group3` <- function (x, year = c('water', 'calendar')){
  year <- match.arg(year)
  yr <- switch(year,
               water = water.year(index(x)),
               calendar = years(index(x)))
  sx <- split(x, yr)
  res <- sapply(sx, function(x) c(mindate(x), maxdate(x)))
  dimnames(res)[[1]] <- c("Min", "Max")
  return(t(res))
}
