\name{group2}
\alias{group2}
\title{Calculates the group2 IHA statistics}
\usage{
  group2(x, year = c("water", "calendar"), mimic.tnc = T,
    ...)
}
\arguments{
  \item{mimic.tnc}{should the function perform the
  calculation like the TNC IHA software?}

  \item{...}{additional arguments passed to ddply}

  \item{x}{A zoo object containing the flow series}

  \item{year}{the type of year factor to be used, \code{yr
  = 'water'} or \code{yr = 'calendar'} for water years and
  calendar years respectively}
}
\value{
  a data frame with the group 2 statistics for each year
}
\description{
  The group 2 statistics measure the magnitude of monthly
  water condition and include 12 parameters.
}
\examples{
data(bullrun)
group2(bullrun, 'water')
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
}

