\name{group1}
\alias{group1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Magnitude of monthly water conditions }
\description{
  Calculates the IHA parameter group 1: Magnitude of montly
  water conditions
}
\usage{
group1(x, yr = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A zoo object containing the flow series }
  \item{yr}{ A factor with year designations}
}
\details{
  See IHA documentation: \url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
}
\value{
A matrix with monthly medians.
}
\references{ \url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html} }
\author{ jason.law@portlandoregon.gov }
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, yr = NULL) 
{
    mo <- factor(months(index(x)), levels = month.name[c(10:12, 
        1:9)])
    if (is.null(yr)) 
        yr <- water.year(index(x))
    res <- tapply(as.numeric(x), list(mo, yr), median)
    return(t(res))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
