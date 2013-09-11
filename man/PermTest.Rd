\name{PermTest}
\alias{PermTest}

\title{
Permutation Test
}

\description{
The function performs a permuatation test with Deviance as test statistic.
}

\usage{
PermTest(xx, formula.full, D.full, D.red, model.dat, glm.family, perm, 
	test.vars, cf, adjust, snowfall.args, snowfall.seed, 
	save.stat.data, file.save, use.save.stat.data, file.use)
}

\arguments{
  \item{xx}{Dataset (variables x patients).}
  \item{formula.full}{Formula from the full model.}
  \item{D.full}{Designmatrix of the full model.}
  \item{D.red}{Designmatrix of the reduced model.}
  \item{model.dat}{Dataset with covariables.}
  \item{glm.family}{Family for the regression.}
  \item{perm}{Number of permutations.}
  \item{test.vars}{Variables or groups of variables to test.}
  \item{cf}{Combining function for  the partial tests.}
  \item{adjust}{Method for p-value adjustment.}
  \item{snowfall.args}{A list with parameters for the initialisation of parallelizing with package \code{snowfall}.}
  \item{snowfall.seed}{Start seed.}
  \item{save.stat.data}{Logical value, default is \code{FALSE}. Save the permutation and original test statistic.}
  \item{file.save}{File name for saving.}
  \item{use.save.stat.data}{Logical value, default is \code{FALSE}. Use the saved permutation and original test statistic.}
  \item{file.use}{File name for data loading.}
}

\value{
A list with
\item{\code{statistic}}{Original test data combined with \code{cf}.}
\item{\code{df}}{Degree of freedom for each variable or group of \code{test.vars}.}
\item{\code{p.value}}{Permutation p-value for each variable or group of \code{test.vars}.}
\item{\code{data.perm}}{Permutation test data.}
\item{\code{data.original}}{Original test data.}
}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}

\seealso{
See \code{\link{ResamplelogLik}}, \code{\link{varwiselogLik}} and \code{\link{expr.dev.test}}.
}
