\name{plotDischarge}
\alias{plotDischarge}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotDischarge(z, palette, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{ ~~Describe \code{z} here~~ }
  \item{palette}{ ~~Describe \code{palette} here~~ }
  \item{\dots}{ ~~Describe \code{\dots} here~~ }
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
  ...
}
\references{ ~put references to the literature/web site here ~ }
\author{ ~~who you are~~ }
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
