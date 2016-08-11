\name{group3}
\alias{group3}
\title{Calculate the group 3 IHA parameters.}
\usage{
  group3(x, year = c("water", "calendar"), mimic.tnc = F)
}
\arguments{
  \item{mimic.tnc}{should the function perform the
  calculation like the TNC IHA software?}

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
  extreme water conditions. These metrics will differ from
  TNC metrics where the minimum or maximum occurs during a
  leap year after february 28th.  The TNC software seems to
  assume that all years are leap years. So if the minium
  for a year is Mar 1 of a non-leap year, this code will
  return 60, whereas the TNC sofware returns 61.
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

