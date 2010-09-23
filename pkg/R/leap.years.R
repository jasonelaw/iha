# TODO: Add comment
# 
# Purpose:
# Date: Sep 21, 2010
# Author: JLAW
###############################################################################

leap.year <- function(x){
	if (inherits(x, 'POSIXt'))
		x <- as.POSIXlt(x)$year + 1900
	x%%4 == 0 & (x%%100 != 0 | x%%400 == 0)
}

