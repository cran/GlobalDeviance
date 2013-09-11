\name{varwiselogLik}
\alias{varwiselogLik}
\alias{varwiselogLik.regression}

\title{Variablewise max. log-Likelihood}

\description{Variablewise max. log-Likelihood values for a model.}

\usage{
varwiselogLik(xx, D, glm.family) 

varwiselogLik.regression(xx, D, glm.family) 
}

\arguments{
  \item{xx}{Dataset (variables x observations/patients).}
  \item{D}{Designmatrix.}
  \item{glm.family}{Family for the regression.}
}

\value{Tables with log-Likelihood values for each variable of \code{xx}.
\item{\code{varwiselogLik}}{A table with column \code{deviance}.}
\item{\code{varwiselogLik.regression}}{A list with model fits.}
}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}
