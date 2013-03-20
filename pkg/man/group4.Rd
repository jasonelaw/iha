\name{group4}
\alias{group4}
\title{Calculate the group 4 IHA parameters.}
\usage{
  group4(x)
}
\arguments{
  \item{x}{A zoo object containing the flow series}
}
\value{
  a matrix of group 3 parameters
}
\description{
  The group 4 IHA parameters measure the frequency and
  duration of high and low pulses.
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

