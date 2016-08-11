\name{read.flow}
\alias{read.flow}
\title{Reads a rdb formatted data file from the USGS web site or from a file.}
\usage{
  read.flow(site, start.date, end.date = NULL, gauge = F,
    file = NULL)
}
\arguments{
  \item{site}{the USGS site_no as a string}

  \item{start.date}{a starting date in a format convertible
  to a date using \code{as.Date}}

  \item{end.date}{an ending data in a format convertible to
  a date using \code{as.Date}}

  \item{gauge}{logical describing whether you want gauge
  height data in addition to flow}

  \item{file}{a file name if you are reading from a text
  file}
}
\value{
  A data frame with date and discharge.  If gauge was TRUE,
  it also includes gauge height.  Data qualifiers are
  included also and their meaning can be looked up on the
  USGS web site.
}
\description{
  This function reads hydrology data from the
  waterdata.usgs.gov site or from a file (that is in the
  USGS rdb format).
}
\examples{
d <- read.flow('14211820', start.date = ISOdate(2008,1,1))
head(d)
}
\author{
  Jason Law <jason.e.law@gmail.com>
}
\references{
  http://waterdata.usgs.gov/nwis
}

