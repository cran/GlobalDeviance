\name{expr.dev.test}
\alias{expr.dev.test}

\title{Deviance Test}

\description{
Deviance permuation test.
}

\usage{
expr.dev.test(xx, formula.full, formula.red = NULL, D.red = NULL, model.dat, 
	test.vars, glm.family, perm = 100, method = c("chisqstat", "permutation"), 
	cf="fisher", adjust=FALSE, snowfall.args=list(parallel=FALSE), 
	snowfall.seed, save.stat.data = FALSE, 
	file.save = "GlobalDeviance_statistic_Tperm_and_Tobs.Rdata",
	use.save.stat.data = FALSE, 
	file.use = "GlobalDeviance_statistic_Tperm_and_Tobs.Rdata")
}

\arguments{
  \item{xx}{Dataset (variables x observations/patients).}
  \item{formula.full}{Formula from the full model.}
  \item{formula.red}{Formula from the reduced model.}  
  \item{D.red}{Designmatrix of the reduced model.}
  \item{model.dat}{Dataset with covariables (observations/patients x covariables).}
  \item{test.vars}{Variables or groups of variables to test.}
  \item{glm.family}{Family for the regression.}
  \item{perm}{Number of permutations.}
  \item{method}{Method for the calculation of the p-value.}
  \item{cf}{Combining function for the partial tests.}
  \item{adjust}{Method for p-value adjustment. Not implemented.}
  \item{snowfall.args}{A list with parameters for the initialisation of parallelizing with package \code{snowfall}.}
  \item{snowfall.seed}{Start seed.}
  \item{save.stat.data}{Logical value, default is \code{FALSE}. Save the permutation and original test statistic.}
  \item{file.save}{File name for saving.}
  \item{use.save.stat.data}{Logical value, default is \code{FALSE}. Use the saved permutation and original test statistic.}
  \item{file.use}{File name for data loading.}
}

\value{
A list
\item{\code{method}}{Method for the calculation of the p-value.}
\item{\code{number.of.variables}}{Number of variables.}
\item{\code{number.of.permutations}}{Number of permutations.}
\item{\code{formula.full}}{Formula from the full model.}
\item{\code{formula.red}}{Formula from the reduced model.}
\item{\code{test}}{Test results.}
\item{\code{data.perm}}{Permutation test statistic.}
\item{\code{data.original}}{Original test statistic.}
\item{\code{test.vars}}{Variables or groups of variables to test.}

}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}

\seealso{
See \code{\link{PermTest}}, \code{\link{varwiselogLik}} and \code{\link{Rossi}}.
}

\examples{
\dontrun{
### Example 1: poisson random data 
set.seed(6666)
n<-100
Y1<-c(rpois(n, 1))
Y2<-c(rpois(n/2, 1), rpois(n/2, 10))
A<-rnorm(n)
B<-c(rep(1, n/2), rep(0, n/2))       # group variable
C<-rpois(n, 1)

test.variables<-list("Y1", "Y2", c("Y1", "Y2"))
names(test.variables)<-c("Y1", "Y2", "Y1, Y2")

t.random<-expr.dev.test(xx=t(data.frame(Y1, Y2)), formula.full=~ A + B + C, 
	formula.red=~ A + C, model.dat=data.frame(A, B, C), test.vars=test.variables, 
	glm.family=poisson(link="log"), perm=1000, method="permutation", cf="fisher", 
	snowfall.args=list(parallel=TRUE), snowfall.seed=54321)

summary(t.random)



### Example 2:  data set Rossi
data(Rossi)

# Covariables (patients x covariables)
model.dat<-Rossi[, c("arrest", "fin", "wexp")]
str(model.dat)

# data (variables/genes x patients)
xx<-rbind(t(t(t(Rossi[, c("prio", "n.work.weeks")]))), rpois(432, 1))
rownames(xx)<-c("prio", "n.work.weeks", "random")

formula.full<- ~ arrest + fin + wexp
formula.red<- ~ arrest + fin

test.vars<-list("prio", "n.work.weeks", "random", c("prio", "n.work.weeks"), 
	c("prio", "n.work.weeks", "random"))
names(test.vars)<-c("prio", "n.work.weeks", "random", "prio+n.work.weeks", 
	"prio+n.work.weeks+random")

set.seed(54321)

t.rossi1<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
	D.red=NULL, model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
	perm=100, method="permutation", cf="fisher")

t.rossi2<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
	D.red=NULL, model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
	perm=100, method="chisqstat", cf="fisher")

summary(t.rossi1, digits=4)

summary(t.rossi2)

}
}