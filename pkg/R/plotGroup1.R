#'Plot group1 statistics
#'
#'Plots group1 statistics using matplot
#'@param x a matrix of group1 staistics
#'@param ... additional arguments passed to matplot
#'@export
`plotGroup1` <-
function (x, ...) 
{	
    matplot(1:ncol(x), t(x), xaxt = "n", ylab = "Average Discharge", 
        ...)
    axis(1, at = 1:ncol(x), labels = dimnames(x)[[2]])
}
