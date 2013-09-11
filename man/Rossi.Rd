\name{Rossi}
\alias{Rossi}
\docType{data}

\title{
Dataset \code{Rossi}
}

\description{
Dataset to test the package.
}

\usage{data(Rossi)}
\format{
  A data frame with 432 observations on the following 63 variables.
  \describe{
    \item{\code{week}}{A numeric vector. Response (week of arrest after release)}
    \item{\code{arrest}}{A numeric vector. Censoring indicator (1 = case, Study time: one year)}
    \item{\code{fin}}{A numeric vector. Indicator for financial support.}
    \item{\code{age}}{A numeric vector. Age in years.}
    \item{\code{race}}{A numeric vector. Race (1=black, 0=white).}
    \item{\code{wexp}}{A numeric vector.  Indicator for work experience prior to arrest.}
    \item{\code{mar}}{A numeric vector. Indicator for married person.}
    \item{\code{paro}}{A numeric vector. Indicator for parolee.}
    \item{\code{prio}}{A numeric vector. Number of previous convictions.}
    \item{\code{educ}}{A numeric vector. Lebel of education (Scala 2-6  increasing)}
    \item{\code{emp1}}{52 numeric vectors. 0 = no work, 1 = work}
    \item{\code{emp2}}{A numeric vector.}
    \item{\code{emp3}}{A numeric vector.}
    \item{\code{emp4}}{A numeric vector.}
    \item{\code{emp5}}{A numeric vector.}
    \item{\code{emp6}}{A numeric vector.}
    \item{\code{emp7}}{A numeric vector.}
    \item{\code{emp8}}{A numeric vector.}
    \item{\code{emp9}}{A numeric vector.}
    \item{\code{emp10}}{A numeric vector.}
    \item{\code{emp11}}{A numeric vector.}
    \item{\code{emp12}}{A numeric vector.}
    \item{\code{emp13}}{A numeric vector.}
    \item{\code{emp14}}{A numeric vector.}
    \item{\code{emp15}}{A numeric vector.}
    \item{\code{emp16}}{A numeric vector.}
    \item{\code{emp17}}{A numeric vector.}
    \item{\code{emp18}}{A numeric vector.}
    \item{\code{emp19}}{A numeric vector.}
    \item{\code{emp20}}{A numeric vector.}
    \item{\code{emp21}}{A numeric vector.}
    \item{\code{emp22}}{A numeric vector.}
    \item{\code{emp23}}{A numeric vector.}
    \item{\code{emp24}}{A numeric vector.}
    \item{\code{emp25}}{A numeric vector.}
    \item{\code{emp26}}{A numeric vector.}
    \item{\code{emp27}}{A numeric vector.}
    \item{\code{emp28}}{A numeric vector.}
    \item{\code{emp29}}{A numeric vector.}
    \item{\code{emp30}}{A numeric vector.}
    \item{\code{emp31}}{A numeric vector.}
    \item{\code{emp32}}{A numeric vector.}
    \item{\code{emp33}}{A numeric vector.}
    \item{\code{emp34}}{A numeric vector.}
    \item{\code{emp35}}{A numeric vector.}
    \item{\code{emp36}}{A numeric vector.}
    \item{\code{emp37}}{A numeric vector.}
    \item{\code{emp38}}{A numeric vector.}
    \item{\code{emp39}}{A numeric vector.}
    \item{\code{emp40}}{A numeric vector.}
    \item{\code{emp41}}{A numeric vector.}
    \item{\code{emp42}}{A numeric vector.}
    \item{\code{emp43}}{A numeric vector.}
    \item{\code{emp44}}{A numeric vector.}
    \item{\code{emp45}}{A numeric vector.}
    \item{\code{emp46}}{A numeric vector.}
    \item{\code{emp47}}{A numeric vector.}
    \item{\code{emp48}}{A numeric vector.}
    \item{\code{emp49}}{A numeric vector.}
    \item{\code{emp50}}{A numeric vector.}
    \item{\code{emp51}}{A numeric vector.}
    \item{\code{emp52}}{A numeric vector.}
    \item{\code{n.work.weeks}}{A numeric vector. Number of weeks with work.}
  }
}

\references{
Fox, John. An R and S-PLUS Companion to Applied Regression, Sage Publications, 2002.
\cr
\url{http://cran.r-project.org/doc/contrib/Fox-Companion/scripts.html}
\cr
\cr
Rossi, P., R. Berk, and K. Lenihan (1980). Money, work, and crime: experimental evidence. Quantitative studies in social relations. Academic Press.
}

\examples{
\dontrun{
### prepares the dataset 'Rossi' for the package 'GlobalDeviance'
setwd(...)

Rossi<-read.table("Rossi.txt", header=TRUE)

Rossi$n.work.weeks<-rowSums(Rossi[, grepl("emp[0-90-9]", names(Rossi))], na.rm=TRUE)

save(Rossi, file="Rossi.rda")



### load dataset 'Rossi'
data(Rossi)

str(Rossi)

names(Rossi)

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
	model.dat=model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
	perm=100, method="permutation", cf="fisher")

t.rossi2<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
	 model.dat=model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
	perm=100, method="chisqstat", cf="fisher")

summary(t.rossi1)

summary(t.rossi2)
}
}

\keyword{datasets}
