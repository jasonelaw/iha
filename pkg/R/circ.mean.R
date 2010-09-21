# Function MeanCircularRad from 'circular' package.
# 
# Purpose:
# Date: Sep 21, 2010
# Author: JLAW
###############################################################################


function (x) 
{
	if (any(is.na(x))) {
		circmean <- NA
	}
	else {
		sinr <- sum(sin(x))
		cosr <- sum(cos(x))
		if (sqrt((sinr^2 + cosr^2))/length(x) > .Machine$double.eps) {
			circmean <- atan2(sinr, cosr)
		}
		else {
			circmean <- NA
		}
	}
	return(circmean)
}
