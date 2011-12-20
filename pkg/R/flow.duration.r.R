# TODO: Add comment
# 
# Purpose:
# Date: Sep 7, 2010
# Author: JLAW
###############################################################################

flow.duration <- function(x, ylab = 'Flow', xlab = 'Exceedance probability', ...){
	cdf <- ecdf(coredata(x))
	#cdf <- plot.stepfun(cdf.stepfun)
  assign('y', with(environment(cdf), 1-y), envir = environment(cdf))
  assign('yleft', 1, envir = environment(cdf))
  assign('yright', 0, envir = environment(cdf))
	#plot(1- cdf$y, cdf$t[-1], log = log, type = 'l', xlab = xlab, ylab = ylab, ...)
  class(cdf) <- class(cdf)[-1]
  plot(cdf, main = 'Flow duration curve', ylab = 'Probability Flow is Exceeded',
       xlab = 'Flow', xlim = range(coredata(x)), ...)
  invisible(cdf)
}


