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

'group2.alt' <-
function(x, year, window = c(1, 3, 7, 30, 90)){
	rollx <- mapply('runmean', k = window, MoreArgs = list(x = coredata(x), alg = 'fast', endrule = 'NA'))
	xd <- data.frame(year = as.factor(water.year(index(x))))
	xd$val <- rollx
	res <- ddply(xd, .(year), 
			function(x){
				rng <- as.numeric(apply(x$val, 2, range, na.rm=T))
				baseindex <- min(x$val[,3], na.rm=T) / mean(x$val[,1])
				zeros <- length(which(x[,1] == 0))
				c(rng, zeros, baseindex)
			})
	nms <- sprintf(c('%1$s Day Min', '%1$s Day Max'), rep(window, each=2))
	names(res) <- c('Year', nms, 'Zero flow days', 'Base index')
	return(res)
}	


