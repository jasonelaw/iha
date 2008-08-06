`plotDischarge` <-
function (z, palette, ...) 
{
    require(lattice)
    require(RColorBrewer)
    y <- as.numeric(z)
    x <- index(z)
    f <- water.year(x)
    grp <- cut(y, quantile(y))
    cols <- brewer.pal(length(levels(grp)), palette)
    pl <- xyplot(y ~ x | f, groups = grp, panel = function(x, 
        y, ...) {
        panel.lines(x, y, col = "black")
        panel.superpose(x, y, ...)
    }, scales = list(x = list(relation = "free"), y = list(log = F)), 
        type = c("p"), layout = c(1, 7), as.table = T, ylim = c(-1, 
            quantile(y, probs = c(0.975))), ylab = "Discharge (cfs)", 
        xlab = "", par.settings = list(superpose.symbol = list(fill = cols, 
            col = cols, pch = 16), superpose.line = list(col = "black")), 
        ...)
    invisible(pl)
}
