`group1` <-
function (x, year = c('water', 'calendar'), FUN = median) 
{
	year <- match.arg(year)
	switch(year,
			water = {
				yr <- water.year(index(x))
				lvls <- month.name[c(10:12, 1:9)]},
			calendar = {
				yr <- years(index(x))
				lvls <- month.name})
	mo <- factor(months(index(x)), levels = lvls)
    res <- tapply(as.numeric(x), list(mo, yr), FUN)
	attr(res, 'FUN') <- deparse(substitute(mean))
    return(t(res))
}
