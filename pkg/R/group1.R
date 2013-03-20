#'Magnitude of monthly water conditions
#'
#'Calculates the IHA parameter group 1: Magnitude of montly water conditions
#'
#'See IHA documentation:
#'\url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
#'
#'@inheritParams group3
#'@param FUN the function to be applied to the monthly values.  TNC uses median which is the default here.
#'@return A matrix with monthly medians.
#'@author jason.e.law@@gmail.com
#'@references
#'\url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
#'@importFrom zoo index coredata
#'@import lattice
#'@import plyr
#'@export
#'@examples
#'data(bullrun)
#'group1(bullrun, 'water')
`group1` <-
function (x, year = c('water', 'calendar'), FUN = median) 
{
	year <- match.arg(year)
	switch(year,
			water = {
				yr <- water.year(index(x))
				lvls <- month.name[c(10:12, 1:9)]},
			calendar = {
				yr <- years(index(x))
				lvls <- month.name})
	mo <- factor(months(index(x)), levels = lvls)
  res <- tapply(as.numeric(x), list(mo, yr), FUN)
	attr(res, 'FUN') <- deparse(substitute(FUN))
  return(t(res))
}
