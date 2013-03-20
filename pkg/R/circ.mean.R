#'@rdname internal
circ.mean <- function (x, units = c('days', 'radians')) 
{
  # Function MeanCircularRad from 'circular' package.
  units <- match.arg(units)
  if (identical(units, 'days')){
    x <- x * (2 * pi) / 365.25
  }
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
  if (circmean < 0){
    circmean <- 2 * pi + circmean
  }
  if (identical(units, 'days')){
    circmean <- circmean * 365.25 / (2 * pi)
  }
	return(circmean)
}
