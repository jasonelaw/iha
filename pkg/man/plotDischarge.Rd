\name{plotDischarge}
\alias{plotDischarge}
\title{Plot discharge}
\usage{
  plotDischarge(z, palette = "Dark2", log = F, ...)
}
\arguments{
  \item{z}{a zoo object with flow data}

  \item{palette}{an RColorBrewer palette name for flow
  quantiles}

  \item{log}{logical indicating whether the y axis should
  be log scaled or not}

  \item{...}{additional arguments passed to \link{xyplot}}
}
\description{
  Plot discharge using a lattice plot
}

