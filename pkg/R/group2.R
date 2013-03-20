#'Calculates the group2 IHA statistics
#'
#'The group 2 statistics measure the magnitude of monthly water condition and
#'include 12 parameters.
#'
#'@inheritParams group3
#'@param window the rolling statistic window sizes
#'@return a data frame with the group 2 statistics for each year
#'@author jason.e.law@@gmail.com
#'@references \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
#'@export
#'@examples
#'data(willamette)
#'group2(willamette, 'water')
#'
'group2' <- function(x, year = c('water', 'calendar'), window = c(1, 3, 7, 30, 90), ...){
  year <- match.arg(year)
  yr <- switch(year,
               water = water.year(index(x)),
               calendar = years(index(x)))
	rollx <- mapply('runmean', k = window, MoreArgs = list(x = coredata(x), alg = 'fast', endrule = 'NA'))
	xd <- data.frame(year = yr)
  xd$val <- rollx
	res <- ddply(xd, .(year), 
			function(x){
				rng <- as.numeric(apply(x[,-1], 2, range, na.rm=T))
				baseindex <- min(x$val[,3], na.rm=T) / mean(x$val[,1])
				zeros <- length(which(x[,1] == 0))
				c(rng, zeros, baseindex)
			}, ...)
	nms <- sprintf(c('%1$s Day Min', '%1$s Day Max'), rep(window, each=2))
	names(res) <- c('Year', nms, 'Zero flow days', 'Base index')
	return(res)
}	


