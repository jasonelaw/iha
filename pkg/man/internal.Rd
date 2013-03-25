\name{as.data.frame.rle}
\alias{as.data.frame.rle}
\alias{baseflow.index}
\alias{circ.mean}
\alias{meandiff}
\alias{monotonic.segments}
\alias{pulse.location}
\alias{pulse.numbers}
\alias{pulses}
\alias{rle.end}
\alias{rle.start}
\title{Internal functions in IHA}
\usage{
  as.data.frame.rle(x)

  baseflow.index(x, na.rm = F)

  circ.mean(x, units = c("days", "radians"))

  meandiff(x, FUN = median, na.rm = T)

  monotonic.segments(x, diff = T)

  pulse.location(x, XFUN = median)

  pulse.numbers(x)

  pulses(x, q)

  rle.start(x)

  rle.end(x)
}
\description{
  These are internal, undocumented (for now) functions in
  the IHA package
}

