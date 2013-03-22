#'Calculate the group 4 IHA parameters.
#'
#'The group 4 IHA parameters measure the frequency and duration
#'of high and low pulses.  
#'
#'@details By default, the pulse thresholds
#'are the 25th and 75th percentiles of the distribution of flows.
#'TNC's IHA software uses the quantile as defined \url{http://www.roguewave.com/portals/0/products/imsl-numerical-libraries/c-library/docs/8.0/html/cstat/stat.htm}
#'which corresponds to R's \code{type = 6} option in \link{quantile}.  The
#'default thresholds here are calculated using R's default \code{type = 7} option.
#'
#'@inheritParams group3
#'@return a matrix of group 3 parameters
#'@author jason.e.law@@gmail.com
#'@references \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
#'@importFrom zoo coredata
#'@export
#'@examples
#'data(bullrun)
#'group4(bullrun)
`group4` <- function(x, thresholds = NULL){
  stopifnot(is.zoo(x))
  if (is.null(thresholds)){
    thresholds <- quantile(coredata(x), probs = c(0.25, 0.75))
  }
  stopifnot(identical(length(thresholds), 2L))
  p <- pulses(coredata(x), thresholds)
  st.date <- index(x)[rle.start(p)]
  st.date.wy <- water.year(st.date)
  numbers <- sapply(split(p$values, st.date.wy), pulse.numbers)
  ldp <- split(as.data.frame(p), st.date.wy)
  lengths <- sapply(ldp, FUN = pulse.location)
  res <- cbind(number = t(numbers), length = t(lengths))
  colnames(res) <- c('Low pulse number', 'High pulse number', 'Low pulse length', 'High pulse length')
  return(res[,c(1,3,2,4), drop = F])
}
