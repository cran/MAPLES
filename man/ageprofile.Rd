\name{ageprofile}
\alias{ageprofile}
\title{Computes smoothed transition rates by respondent's age (age profiles).}
\description{
Computes age profiles for a specific transition between two states according to 
a set of time-fixed or time-varying covariates. It needs an micro-level episode-data 
structure, i.e. a longitudinal dataset containing the following variables:\cr \cr
start : starting date of observation;\cr
Tstop : ending date of observation;\cr
Status : is 0 if right censored; 1 if event occurred; 2 if left censored; 
  3 if interval censored. Status is equal to 1 if and only if the date of the event 
  precedes the date of right censoring.\cr
Agestart - ages at starting date (Start)\cr
Agestop Age at the ending date (Stop)\cr 
An episode-data structure can be obtained through the command epdata.}
\usage{
ageprofile(formula, epdata, tr.name = "Transition", win, 
           method = "car", agelimits = c(0, 100), 
           outfile = FALSE, tails = c(FALSE, FALSE), 
           subset = TRUE, weight, 
           sig.eff = TRUE, sig.lev = 0.05)
}
\arguments{
  \item{formula}{
a formula object specifying the ~ operator and factors variables
separated by '+' operators. Response variable on the left is not required.
The expression ~1 implies that only the baseline (age profile for the whole sample)
will be provided. Note that interaction terms are not recognized by the formula: 
~v1:v2 or ~v1*v2 gives the same results as ~v1+v2.
}
  \item{epdata}{
a dataframe containing episode-data prepared by epdata command optionally with 
time-varying factor variables created by splitter command.
}
  \item{tr.name}{a string containing the name of the considered transition}
  \item{win}{
a matrix with two columns containing the initial and final calendar date specifiyng 
a restricted window of observation. Only events and exposure times referring to 
this window will be considered in the analysis. If win argument is not specified, 
the whole episode is considered.
For example, let us consider an episode data structure coming from a retrospective
survey held on January 1, 2010. Since we want to compute transition rates according to
behaviours experienced in the last 10 years, we can restrict our window ob observation
to the decade January 1, 2000 - January 1, 2010. Thus, the win argument would be a
matrix with two columns, the first containing the exact data 2000 and the second the exact 
date 2010.\cr
Window of observation may be also limited to specific ages or events. For example,
win=cbind(date_at_birth+15,date_at_birth+20) restricts observations within the 
age group 15-19 (completed) years of age and\cr
win=cbind(date_at_marriage,date_at_the_interview) restricts observatins 
between marriage and the interview.

Note that in the win matrix no missing data are allowed.
}
  \item{method}{specifies the type of rates to compute. There are three
  alternatives:\cr
'cpr'  for Cohort Period Rates
'car' for Cohort Age Rates
'cap' for Cohort Age Probabilities
}
  \item{agelimits}{
  	a couple of values indicating the lower and the upper limit of age interval 
    to be considered. It can be useful to restrict age interval when the transition 
    is never or almost never experienced outside a specific age interval. For example,
    the transition rates for the first child birth may be limited to the age interval
    (15-50).}
  \item{outfile}{
    if TRUE writes the output on a file named 'trname.txt' where 'trname' is the 
    string specified in the tr.name argument. 
}
  \item{tails}{
  a vector of two logical elements indicating respectively if the left and the 
  right tails must be flattened. This option may be useful if we can assume 
  that the transition rate is approximately zero at the borders of the considered 
  age interval.
}
  \item{subset}{
  an optional vector specifying a subset of observations to be used in the 
  estimation process.
}
  \item{weight}{
 an optional vector containing (post-sampling) weights. 
}
  \item{sig.eff}{
  if TRUE the age profile for a specific subgroup defined by factor levels is
  fixed as identical to the baseline if the relative risk (for aech specific 
  age-subinterval) is not statistically significant at the level specified by 
  sig.lev. In other words, the relative risk in a specific age subinterval is zero 
  if the pvalue is higher than sig.lev (see details).
}
  \item{sig.lev}{
  specifies the maximum level significance under which the relative risk in a 
  specific age-subinterval is non-zero (if sig.eff=TRUE). The default value is 0.05.
}
}
\details{
p-values for the null hypothesis that the corresponding parameter is zero is 
calculated with reference to the t distribution with the estimated residual 
degrees of freedom for the model fit if the dispersion parameter has been estimated, 
and the standard normal if not.
}
\value{
Gives a list of objects:
\item{profiles}{a matrix containing the smoothed age profiles for the whole sample (baseline)
and for each factor level considered}
\item{unsmoothed}{a matrix containing the unsmoothed transition rates, i.e. the ratio
between occurences and exposures for each age and factor level}
\item{knot}{a matrix with the two knots (in column) for each factor level (rows)}
\item{event}{a matrix with the number of event occured in the three age sub-intervals defined
by knots (columns) for each factor level (rows)}
\item{rrisk}{a matrix with the estimated relative risks in the three age sub-intervals
 (columns) for each factor level (rows)}
\item{se}{a matrix with the standard error related to the relative risk computed 
in the three age sub-intervals (columns) for each factor level (rows)}
\item{pvalue}{a matrix with the pvalues related to the hypothesis that the
relative risk in each age sub-interval is different from zero (columns) for each 
factor level (rows)}
\item{factors}{a vector of names containing the factors specified in the formula argument}
\item{trname}{the name of the transition in analysisi as specified in the tr.name argument.}
\item{ANOVAtest}{pvalues anova test for each factor covariate}
\item{factors}{vector of string containing the names of factor covariates as specified in 
the formula argument.} 
\item{method}{the method used for the computaion of rates as speficied in the method argument.}
\item{agelimits}{the age interval as specified in the agelimits argument.}
\item{tails}{tails argument.}
}
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility),DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}
\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}
\note{
In order to have an unambiguosly output, it is strongly raccomended to label 
each level of factor variables and to avoid using the same label for different
factors.
}      

\seealso{
\code{\link{epdata}},
\code{\link{splitter}},
\code{\link{plotap}}
}
\examples{
# creates an episode-data structure relating to the transition 
# childless-->first child
ep1<-with(demogr,epdata(start=dbirth, event=dch1, rcensor=dint, 
        birth=dbirth,id=id,
        addvar=subset(demogr,select=c(-id,-dbirth)))) 

# creates a new episode-data structure with a time-varying factor 
# variable relating to the status "never married" (not_marr) or 
# "ever married"(marr)  
ep2<-splitter(ep1,split=ep1$d1marr,tvar.lev=c("not_marr","marr"),
              tvar.name="mar")

# Estimates age profiles for the transition to the first birth 
# according to the following factors: 
# sex (respondent'sex w/2 levels: 'Male', 'Female');
# edu ('Level of education w/3 levels: 'low_sec','upp_sec', 'tert');
# mar (ever married w/2 levels: 'not_marr', 'marr')  
ch1.ap<-ageprofile(formula=~sex+edu+mar, epdata=ep2, 
                   tr.name="First child", agelimits=c(15,50))

# The estimates are obtained under the hypothesis of independence among 
# factors. We can relax this hp by considering the interaction between 
# factors. The following commands add the interaction between sex and edu. 
ep2$inter<-ep2$sex:ep2$edu
ch1.ap<-ageprofile(formula=~sex+edu+mar+inter, epdata=ep2, 
                   tr.name="First child", agelimits=c(15,50))
}
\keyword{smooth}
\keyword{age|profile}
\keyword{transition|rates}
