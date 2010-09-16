`plot.group1` <-
function (x, ...) 
{	
    matplot(1:ncol(x), t(x), xaxt = "n", ylab = "Average Discharge", 
        ...)
    axis(1, at = 1:ncol(x), labels = dimnames(x)[[2]])
}
