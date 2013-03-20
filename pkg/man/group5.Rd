\name{group5}
\alias{group5}
\title{Calculate the group 5 IHA parameters.}
\usage{
  group5(x, year = c("water", "calendar"))
}
\arguments{
  \item{x}{A zoo object containing the flow series}

  \item{year}{the type of year factor to be used, \code{yr
  = 'water'} or \code{yr = 'calendar'} for water years and
  calendar years respectively}
}
\value{
  a matrix of group 5 parameters
}
\description{
  The group 5 IHA parameters measure the rate and frequency
  of water condition changes.
}
\examples{
data(bullrun)
group5(bullrun, 'water')
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
}

