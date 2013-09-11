\name{ResamplelogLik}
\alias{ResamplelogLik}

\title{log-Likelihood values of Permutations}

\description{
log-Likelihood values from all permutations.
}

\usage{
ResamplelogLik(xx, D.full, glm.family, nperm.used, covars, use.permMat, permMat, 
		snowfall.args, snowfall.seed)
}

\arguments{
  \item{xx}{Dataset (genes x patients).}
  \item{D.full}{Designmatrix.}
  \item{glm.family}{Family for the regression.}
  \item{nperm.used}{Number of permutations for the test.}
  \item{covars}{Columns for the test.}
  \item{use.permMat}{Use permutation matrix TRUE/FALSE.}
  \item{permMat}{Permutation matrix.}
  \item{snowfall.args}{A list with parameters for the initialisation of parallelizing with package \code{snowfall}.}
  \item{snowfall.seed}{Start seed.}
}

\value{A list with log-Likelohood values for each permutated designmatrix.}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}

\seealso{
See \code{\link{Functions_for_Permutation}}.
}
