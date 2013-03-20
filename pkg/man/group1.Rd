\name{group1}
\alias{group1}
\title{Magnitude of monthly water conditions}
\usage{
  group1(x, year = c("water", "calendar"), FUN = median)
}
\arguments{
  \item{FUN}{the function to be applied to the monthly
  values.  TNC uses median which is the default here.}

  \item{x}{A zoo object containing the flow series}
}
\value{
  A matrix with monthly medians.
}
\description{
  Calculates the IHA parameter group 1: Magnitude of montly
  water conditions
}
\details{
  See IHA documentation:
  \url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
}
\examples{
data(willamette)
group1(willamette, 'water')
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.nature.org/initiatives/freshwater/conservationtools/art17004.html}
}

