`plotDischarge` <-
function (z, palette = 'Dark2', log = F, ...) 
{
    y <- as.numeric(z)
    x <- index(z)
    f <- water.year(x)
    grp <- cut(y, quantile(y), include.lowest = T)
    cols <- brewer.pal(length(levels(grp)), palette)
    pl <- xyplot(y ~ x | f, groups = grp, panel = function(x, 
        y, ...) {
        panel.lines(x, y, col = "black")
        panel.superpose(x, y, ...)
    }, scales = list(x = list(relation = "free"), y = list(log = log)), 
        type = c("p"), layout = c(1, nlevels(f)), as.table = T, ylim = c(-1, 
            quantile(y, probs = c(0.975))), ylab = "Discharge (cfs)", 
        xlab = "", par.settings = list(superpose.symbol = list(fill = cols, 
            col = cols, pch = 16), superpose.line = list(col = "black")), 
        ...)
    invisible(pl)
}
