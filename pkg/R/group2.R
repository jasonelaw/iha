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

f <- function(x, window = c(1, 3, 7, 30, 90)){
	window <- c('3day' = 3, '7day' = 7, '30day' = 30, '90day' = 90)
	rollx <- mapply('rollmean', k = window, MoreArgs = list(x = coredata(x), na.pad = T))
	x <- cbind(x, rollx)
	xd <- as.data.frame(x)
	year <- as.factor(water.year(index(x)))
	spl_xd <- split(xd, year)
	ldply(spl_xd, function(x) as.numeric(apply(x, 2, range, na.rm=T)))
}	


