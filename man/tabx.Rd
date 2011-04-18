\name{tabx}
\alias{tabx}
\title{Prints univariate and bivariate frequency table.}
\description{Prints univariate or a bivariate frequency distribution table including marginal 
distribution and total number of cases.}
\usage{tabx(x, y, prow = FALSE, pcol = FALSE, chisq=FALSE )}
\arguments{
  \item{x}{a vector which can be interpred as factor.}
  \item{y}{an optional second vector which can be interpreted as factor (columns
  in the contingency table).}
  \item{prow}{if TRUE it adds a bivariate table containing row percentages.}
  \item{pcol}{if TRUE it adds a bivariate table containing column percentages.}
  \item{chisq}{gives the results for a Chi square test for independence of all factors.}
}
\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}  

\seealso{
\code{\link{table}},
\code{\link{summary.table}},
} 
\examples{
tabx(demogr$sex,demogr$edu,chisq=TRUE)
tabx(demogr$sex,demogr$edu,prow=TRUE,pcol=TRUE)
}
\keyword{univar}
\keyword{frquencies} 
