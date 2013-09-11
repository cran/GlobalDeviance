\name{Combining_Functions}
\alias{Combining_Functions}
\alias{fisher}
\alias{liptak}
\alias{tippett}
\alias{lancaster}

\title{
Combining Functions
}

\description{
Combining Functions
}

\usage{
fisher(p)

liptak(p)

tippett(p)

lancaster(p, r, s) 
}

\arguments{
  \item{p}{Vector with p-values.}
  \item{r}{rate parameter forgamma distribution.}
  \item{s}{Scale parameter for gamma distribution.}
}

\value{
A vector p-values.
}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}

\seealso{
See \code{\link{expr.dev.test}}.
}
