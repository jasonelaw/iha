\name{as.data.frame.rle}
\alias{as.data.frame.rle}
\alias{circ.mean}
\alias{maxdate}
\alias{meandiff}
\alias{mindate}
\alias{monotonic.segments}
\alias{pulse.location}
\alias{pulse.numbers}
\alias{pulses}
\alias{rezero.year}
\alias{rle.end}
\alias{rle.start}
\title{Internal functions in IHA}
\usage{
  as.data.frame.rle(x)

  circ.mean(x, units = c("days", "radians"))

  maxdate(x, julian = T)

  meandiff(x, na.rm = T)

  mindate(x, julian = T)

  monotonic.segments(x, diff = T)

  pulse.location(x, XFUN = median)

  pulse.numbers(x)

  pulses(x, q)

  rezero.year(x, month = 10, day = 1, year.prefix = "WY")

  rle.start(x)

  rle.end(x)
}
\description{
  These are internal, undocumented (for now) functions in
  the IHA package
}

