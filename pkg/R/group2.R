`group2` <-
function (x, yr = NULL) 
{
    if (is.null(yr)) 
        yr <- water.year(index(x))
    ext <- annual.extrema(x)
    sx <- split(x, yr)
    zeros <- sapply(sx, function(x) length(which(x == 0)))
    baseindex <- sapply(sx, function(x) min(rollmean(x, 7))/mean(x))
    cbind(ext, "Zero flow days" = zeros, "Base index" = baseindex)
}
