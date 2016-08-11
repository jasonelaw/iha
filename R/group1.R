#'Magnitude of monthly water conditions
#'
#'Calculates the IHA parameter group 1: Magnitude of montly water conditions
#'
#'See IHA documentation:
#'\url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
#'
#'@inheritParams group5
#'@param FUN the function to be applied to the monthly values.  TNC uses median which is the default here.
#'@return A matrix with monthly medians.
#'@author jason.e.law@@gmail.com
#'@references
#'\url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
#'@importFrom zoo index coredata is.zoo
#'@importFrom lubridate year month
#'@export
#'@examples
#'data(bullrun)
#'group1(bullrun, 'water')
`group1` <-
function (x, year = c('water', 'calendar'), FUN = median) 
{
  stopifnot(is.zoo(x))
	year <- match.arg(year)
  idx <- index(x)
	yr <- switch(year,
	             water    = water.year(idx),
	             calendar = year(idx))
	mo <- switch(year,
	               water    = water.month(idx, label = TRUE, abbr = FALSE),
	               calendar = month(idx, label = TRUE, abbr = FALSE))
  res <- tapply(coredata(x), list(mo, yr), FUN)
	attr(res, 'FUN') <- deparse(substitute(FUN))
  return(t(res))
}
