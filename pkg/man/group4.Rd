\name{group4}
\alias{group4}
\title{Calculate the group 4 IHA parameters.}
\usage{
  group4(x, year = c("water", "calendar"),
    thresholds = NULL)
}
\arguments{
  \item{thresholds}{vector of length 2; the cut off for a
  low pulse and a high pulse, respectively}

  \item{x}{A zoo object containing the flow series}

  \item{year}{the type of year factor to be used, \code{yr
  = 'water'} or \code{yr = 'calendar'} for water years and
  calendar years respectively}
}
\value{
  a matrix of group 3 parameters
}
\description{
  The group 4 IHA parameters measure the frequency and
  duration of high and low pulses.
}
\details{
  By default, the pulse thresholds are the 25th and 75th
  percentiles of the distribution of flows. TNC's IHA
  software uses the quantile as defined
  \url{http://www.roguewave.com/portals/0/products/imsl-numerical-libraries/c-library/docs/8.0/html/cstat/stat.htm}
  which corresponds to R's \code{type = 6} option in
  \link{quantile}.  The default thresholds here are
  calculated using R's default \code{type = 7} option.
}
\examples{
data(bullrun)
group4(bullrun)
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
}

