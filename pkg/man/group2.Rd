\name{group2}
\alias{group2}
\title{Calculates the group2 IHA statistics}
\usage{
  group2(x, year = c("water", "calendar"),
    window = c(1, 3, 7, 30, 90), ...)
}
\arguments{
  \item{window}{the rolling statistic window sizes}

  \item{x}{A zoo object containing the flow series}
}
\value{
  a data frame with the group 2 statistics for each year
}
\description{
  The group 2 statistics measure the magnitude of monthly
  water condition and include 12 parameters.
}
\examples{
data(willamette)
group2(willamette, 'water')
}
\author{
  jason.e.law@gmail.com
}
\references{
  \url{http://www.conservationgateway.org/Files/Pages/indicators-hydrologic-altaspx47.aspx}
}

