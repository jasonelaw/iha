\name{group3}
\alias{group3}
\title{Calculate the group 3 IHA parameters.}
\usage{
  group3(x, year = c("water", "calendar"))
}
\arguments{
  \item{x}{A zoo object containing the flow series}

  \item{year}{the type of year factor to be used, \code{yr
  = 'water'} or \code{yr = 'calendar'} for water years and
  calendar years respectively}
}
\value{
  a matrix of the group 3 parameters
}
\description{
  The group 3 IHA parameters measure the timing of annual
  extreme water conditions
}
\examples{
data(bullrun)
group3(bullrun, 'water')
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
}

