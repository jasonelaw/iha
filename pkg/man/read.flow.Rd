\name{read.flow}
\alias{read.flow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Reads a data file from the USGS web site. }
\description{
  This function reads hydrology data from the waterdata.usgs.gov site or from a file (that is in the USGS format).
}
\usage{
read.flow(site, start.date, end.date = NULL, gauge = F, http = TRUE, file = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{site}{ the usgs site_no }
  \item{start.date}{ a starting date of class Date or POSIXt }
  \item{end.date}{ an ending data in the same format as \code{end.date} }
  \item{gauge}{ logical describing whether you want gauge height data }
  \item{http}{ logical describing whether you want to retrieve data from the web }
  \item{file}{ a file name if you are reading from a text file }
}
\value{
  A data frame with date and discharge.  If gauge was TRUE, it also includes gauge height.
  Data qualifiers are included also and their meaning can be looked up on the USGS web site.
}
\references{ http://waterdata.usgs.gov/nwis }
\author{ Jason Law }

\examples{
d <- read.flow(14211820, start.date = ISOdate(2008,1,1))
head(d)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.


