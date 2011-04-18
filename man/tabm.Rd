\name{tabm}
\alias{tabm}
\title{Print regression estimates for previously fitted linear and logit
regression models.}
\description{
For linear regression models, it prints some basic information about the model 
estimates ( Beta, pvalues, AIC, adjusted R square); for logit models, it also prints
exp(Beta).}
\usage{tabm(mod, pvalues = TRUE, digits = 3)}
\arguments{
  \item{mod}{is an oject of class 'lm' or 'glm'.}
  \item{pvalues}{if TRUE pvalues will be printed out.}
  \item{digits}{specifies the number of digits in the output.}
}
\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}

\seealso{
\code{\link{summary.lm}},
\code{\link{summary.glm}},
}

\examples{
chi<-ifelse(!is.na(demogr$dch1),1,0)
logit.mod<- glm(chi ~ demogr$sex + demogr$edu, 
                family=binomial(link = "logit"))
tabm(logit.mod)
# for more details
summary(logit.mod)
}
