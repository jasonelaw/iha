`extrema2` <-
function (sm, mean.window, ...) 
{
    rollrange <- function(x, mean.window) {
        rm <- rollmean(x, mean.window, na.pad = T)
        range(rm, na.rm = T)
    }
    res <- sapply(sm, rollrange, mean.window = mean.window, ...)
    return(res)
}
