\name{monotonic.segments}
\alias{monotonic.segments}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
monotonic.segments(x, diff = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ ~~Describe \code{x} here~~ }
  \item{diff}{ ~~Describe \code{diff} here~~ }
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
function (x, diff = T) 
{
    if (!diff) 
        x <- diff(x)
    f <- rep("zero", length(x))
    f[x > 0] <- "increasing"
    f[x < 0] <- "decreasing"
    f.runs <- rle(f)
    i <- which(f.runs$values == "zero")
    if (identical(i[1], as.integer(1))) {
        f.runs$values[1] <- f.runs$values[2]
        i <- i[-1]
    }
    if (length(i) > 0) 
        f.runs$values[i] <- f.runs$values[i - 1]
    f <- inverse.rle(f.runs)
    f.runs <- rle(f)
    return(f.runs)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
