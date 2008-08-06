\name{annual.extrema}
\alias{annual.extrema}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
annual.extrema(x, yr = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ ~~Describe \code{x} here~~ }
  \item{yr}{ ~~Describe \code{yr} here~~ }
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
function (x, yr = NULL, ...) 
{
    mean.window <- c(1, 3, 7, 30, 90)
    if (is.null(yr)) 
        yr <- water.year(index(x))
    nr <- 2 * length(mean.window)
    years <- unique(yr)
    nc <- length(years)
    res <- matrix(NA, ncol = nc, nrow = nr)
    for (i in 1:length(mean.window)) {
        res[2 * i + c(-1, 0), ] <- extrema(as.numeric(x), yr, 
            mean.window[i])
    }
    dimnames(res) <- list(as.vector(outer(c("Day Min", "Day Max"), 
        mean.window, function(x, y) paste(y, x))), years)
    return(t(res))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
