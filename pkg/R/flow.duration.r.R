# TODO: Add comment
# 
# Purpose:
# Date: Sep 7, 2010
# Author: JLAW
###############################################################################

flow.duration <- function(x, ylab = 'Flow', xlab = 'Exceedance probability', ...){
	cdf.stepfun <- ecdf(coredata(x))
	cdf <- plot.stepfun(tmp)
	plot(1- cdf$y, cdf$t[-1], log = 'y', type = 'l', xlab = xlab, ylab = ylab, ...)
}


