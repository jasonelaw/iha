#'@rdname internal
baseflow.index <- function(x, na.rm = F){
  num <- min(runmean(x, k = 7, alg = 'fast', endrule = 'NA'), na.rm = na.rm)
  denom <- mean(x, na.rm = na.rm)
  num / denom
}
