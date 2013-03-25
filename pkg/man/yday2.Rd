\name{yday2}
\alias{yday2}
\title{Calculate the day of the year as TNC does in their IHA software}
\usage{
  yday2(x)
}
\arguments{
  \item{x}{a date object that can be handled by the
  lubridate package}
}
\description{
  The day of the year can be calculated using yday from the
  lubridate package. This function does the same but, does
  it like TNC's version of the IHA software. They count
  days as if every year was leap year; every year has 366
  days.
}

