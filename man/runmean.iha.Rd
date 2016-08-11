\name{runmean.iha}
\alias{runmean.iha}
\title{Calculate rolling means for group2 statistics}
\usage{
  runmean.iha(x, year = NULL, mimic.tnc = F)
}
\arguments{
  \item{x}{a numeric vector}

  \item{year}{a vector of year (calendar or water year
  identifiers; necessary for mimic.tnc = T}

  \item{mimic.tnc}{logical should the years be split before
  the running mean is calculated}
}
\description{
  Calculate rolling means four group2 statsistics.  Uses
  runmean from caTools
}

