\name{water.month}
\alias{water.month}
\title{Extract the month of the water year from a date or time object.}
\usage{
  water.month(x, label = FALSE, abbr = TRUE)
}
\arguments{
  \item{x}{a date or time object}

  \item{label}{logical TRUE will return an ordered factor
  for month with the month name as labels}

  \item{abbr}{logical. FALSE will abbreviate the name of
  the month in the ordered factor.}
}
\description{
  Extract the month of the water year from a date or time
  object.  Can be returned as a number 1:12, for October
  through September respectively, or an ordered factor.
}

