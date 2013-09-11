\name{Functions_for_Permutation}
\alias{Functions_for_Permutation}
\alias{.mchoose}
\alias{.nPermsG}
\alias{.nPerms}
\alias{.allpermsG}
\alias{.allperms}

\title{
Helper Functions for Permutation
}

\description{
The functions adapted from packages \code{globaltest} and \code{GlobalAncova}.
}

\usage{
.mchoose(counts)

.nPermsG(counts, grouping)

.nPerms(D.full, model.dat, formula.full)

.allpermsG(counts, grouping)

.allperms(nums) 
}

\arguments{
  \item{counts}{Counts.}
  \item{grouping}{Indices for the group.}
  \item{D.full}{Designmatrix from the full model.}
  \item{model.dat}{Dataset with covariables.}
  \item{formula.full}{Formula from the full model.}
  \item{nums}{Indices to be permuted.}
}

\details{
The function \code{.mchoose} calculates the number of permutations.
\cr
\cr
The function \code{.nPermsG} calculates the number of permutations for multiple groups.
\cr
\cr
The function \code{.nPerms} calculates the number of permutations from the designmatrix.
\cr
\cr
The function \code{.allpermsG} lists all permutations for the multiple-group case.
\cr
\cr
The function \code{.allperms} lists all permutations for the continuos case.
}

\value{
\item{\code{.mchoose}}{A number.}
\item{\code{.nPermsG}}{A number.}
\item{\code{.nPerms}}{Number of permutations (\code{nPerms}) and a vector which counts same rows of the designmatrix (\code{counts}).}
\item{\code{.allpermsG}}{A matrix.}
\item{\code{.allperms}}{A matrix (\code{nums} x \code{nums}!).}
}

\author{Frederike Fuhlbrueck \email{f.fuhlbrueck@googlemail.com}}

\examples{
\dontrun{
### Examples
# Number of permutations
.mchoose(1:3)               # or choose(sum(1:3), 1) * choose(sum(2:3), 2)

# Number of permutations for multiple groups
.nPermsG(1:3, c(1, 1, 2))

# Number of permutations from the designmatrix
D.full<-t(matrix(c(1:9, 1:3), 3, 4))
model.dat<-matrix(c(1,0,0,1,0,1,0,0), 4, 2)
colnames(model.dat)<-c("A", "B")
formula.full<-~A+B
.nPerms(D.full, model.dat, formula.full)

# All permutations for the multiple-group case
.allpermsG(c(2, 1, 2), c(1, 1, 2)) 

# All permutations for the continuos case
.allperms(1:3)
}
}
