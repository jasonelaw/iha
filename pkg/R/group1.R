`group1` <-
function (x, yr = NULL) 
{
    mo <- factor(months(index(x)), levels = month.name[c(10:12, 
        1:9)])
    if (is.null(yr)) 
        yr <- water.year(index(x))
    res <- tapply(as.numeric(x), list(mo, yr), median)
    return(t(res))
}
