\name{annual.extrema}
\alias{annual.extrema}
\alias{as.data.frame.rle}
\alias{baseflow.index}
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
\alias{years}
\title{Internal functions in IHA}
\usage{
  annual.extrema(x, yr = NULL, ...)

  as.data.frame.rle(x)

  baseflow.index(x, na.rm = F)

  circ.mean(x, units = c("days", "radians"))

  maxdate(x, julian = T)

  meandiff(x, FUN = median, na.rm = T)

  mindate(x, julian = T)

  monotonic.segments(x, diff = T)

  pulse.location(x, XFUN = median)

  pulse.numbers(x)

  pulses(x, q)

  rezero.year(x, month = 10, day = 1, year.prefix = "WY")

  rle.start(x)

  rle.end(x)

  years(x, abbreviate = FALSE)
}
\description{
  These are internal, undocumented (for now) functions in
  the IHA package

  These are internal, undocumented (for now) functions in
  the IHA package
}

