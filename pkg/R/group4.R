#'Calculate the group 4 IHA parameters.
#'
#'The group 4 IHA parameters measure the frequency and duration
#'of high and low pulses.
#'
#'@inheritParams group3
#'@return a matrix of group 3 parameters

#'@author jason.e.law@@gmail.com
#'@references \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
#'@export
#'@examples
#'data(bullrun)
#'group4(bullrun)
`group4` <- function(x){
  q <- quantile(as.numeric(x), probs = c(0.25, 0.75))
  p <- pulses(as.numeric(x), q)
  st.date <- index(x)[rle.start(p)]
  st.date.wy <- water.year(st.date)
  numbers <- sapply(split(p$values, st.date.wy), pulse.numbers)
  ldp <- split(as.data.frame(p), st.date.wy)
  lengths <- sapply(ldp, FUN = pulse.location)
  res <- cbind(number = t(numbers), length = t(lengths))
  colnames(res) <- c('number of low', 'number of high', 'length of low', 'length of high')
  return(res)
}
