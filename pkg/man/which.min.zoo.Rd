\name{which.min.zoo}
\alias{which.max.zoo}
\alias{which.min.zoo}
\alias{which.range.zoo}
\title{Calculate the date of a extreme value for a zoo series}
\usage{
  which.min.zoo(x)

  which.max.zoo(x)

  which.range.zoo(x)
}
\arguments{
  \item{x}{a zoo object}
}
\value{
  the value of the index for the min, max, or range
}
\description{
  These functions calculate the date (or more specifically,
  the value of the index of a zoo object) of an extreme
  value for a zoo series.
}
\examples{
x <- zoo(1:10)
which.min.zoo(x)
which.max.zoo(x)
which.range.zoo(x)
}

