\name{MAPLES-package}
\alias{MAPLES-package}
\alias{MAPLES}
\docType{package}
\title{Smoothed age profile estimation.}
\description{
MAPLES is a general method for the estimation of age profiles that uses standard 
micro-level demographic survey data. The aim is to estimate smoothed age profiles 
and relative risks for time-fixed and time-varying covariates.
}
\details{
\tabular{ll}{
Package: \tab MAPLES\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-04-08\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
LazyData: \tab yes\cr \cr
}
Main functions in the package:\cr
- epdata: prepare episode data for event history analysis   \cr
- splitter: Creates a time-varying factor variables within a episode-data. \cr
- ageprofile: Computes smoothed transition rates by respondent's age (age profiles) \cr
- plotap: plots age profiles.    \cr
Utilities: \cr
- tabx: Prints univariate or a bivariate frequency distribution table including marginal 
distribution and total number of cases.\cr
- tabm: Print regression estimates for previously fitted linear and logit
regression models.\cr
- mkdate: computes dates in continuous years or CMC.\cr
- listvar: shows variables in a dataframe.    
}
\author{
Roberto Impicciatore 
\email{roberto.impicciatore@unimi.it}
}
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility), 
DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}


\examples{
# creates an episode-data structure relating to the transition 
# childless-->first child
ep1<-with(demogr,epdata(start=dbirth, event=dch1, rcensor=dint, 
          birth=dbirth,id=id,
          addvar=subset(demogr,select=c(-id,-dbirth)))) 

# creates a new episode-data structure with a time-varying factor 
# variable relating to the status "never married" (not_marr) or 
# "ever married" (marr)  
ep2<-splitter(ep1,split=ep1$d1marr,tvar.lev=c("not_marr","marr"),
              tvar.name="mar")

# Estimates age profiles for the transition to the first birth 
# according to the following factors: 
# sex (respondent'sex w/2 levels: 'Male', 'Female');
# edu ('Level of education w/3 levels: 'low_sec','upp_sec', 'tert');
# mar (ever married w/2 levels: 'not_marr', 'marr') 

ch1.ap<-ageprofile(formula=~sex+edu+mar, epdata=ep2, 
                   tr.name="First child", agelimits=c(15,50))        

# Plot age profiles in three different graphs
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("Male","Female"),title='first child by sex')
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("low_sec","upp_sec","tert"),title='first child by education')
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("not_marr","marr"),title='first child by marital status', 
        ylim=0.4) 
}
\keyword{package}
\keyword{smooth}
\keyword{age profiles}
\keyword{transition rates}
\keyword{GAM models}
