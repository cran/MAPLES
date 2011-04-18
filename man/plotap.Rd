\name{plotap}
\alias{plotap}
\title{Plots age profiles.} 
\description{
Plots age profiles estimated through command ageprofile.
}
\usage{
plotap(x, lev.labels, baseline = TRUE,  unsmoothed = FALSE, 
        xlim, ylim, title)
}

\arguments{
  \item{x}{the resulting list given by the ageprofile command.}
  \item{lev.labels}{
a vector of strings specifying the factor levels to consider. For example: \cr
lev.labels=c("Male","Female","low_sec","upp_sec","tert") \cr
specifies that 5 curves will bedrawn, one for each level specified. 
It is also possible to draw a combination of levels (under the hypothesis of 
independence between factors)by inserting the symbol "*" between two or more levels.
For example: the string "Male*low_sec" draws a curve for the subgroups of men with
a lower secondary level of education; the string "Male*low_sec*worker" draws a curve for
the subgroup of lower educated men currently employed as a manual worker.  
Even though it is possible to draw any number of curves in one graph, we raccomend 
to consider no more than 5 levels (or combination of levels) in one graph.}
  \item{baseline}{if TRUE the baseline will be drawn.}
  \item{unsmoothed}{if TRUE the unsmoothed transition rates, i.e. the ratio
between occurences and exposures for each age and factor level, are plotted as points
in the graph.}
  \item{xlim}{
a vector of two values defining the limits of X axis measured in years of age 
(default value: c(min(age), max(age))}
  \item{ylim}{
a value defining the upper limit of the Y axis (transition rates). 
Given that transition rates a re strictly positive, the lower limit is always 0 
(default value: 2*max(baseline rates)).  }  
  \item{title}{
title of the graph (default: transition name as stored in the ageprofile argument. }
}      
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility), 
DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}
\author{
Roberto Impicciatore
\email{roberto.impicciatore@unimi.it} 
}   
\seealso{
\code{\link{epdata}},
\code{\link{splitter}},
\code{\link{ageprofile}},
}
\examples{
# creates an episode-data structure relating to the 
# transition childless-->first child
ep1<-with(demogr,epdata(start=dbirth, event=dch1, rcensor=dint,
          birth=dbirth,id=id,
          addvar=subset(demogr,select=c(-id,-dbirth)))) 

# creates a new episode-data structure with a time-varying factor variable
# relating to the status "never married"(not_marr) or "ever married"(marr)  
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
  
# Plot age profiles for the combined effect of sex and level of education
# under the independence hypothesis 
plotap(ch1.ap,base=TRUE, unsmoo=TRUE, 
        lev=c("Female*low_sec","Female*upp_sec","Female*tert"),
        title='first child by education - women (indep hp)') 
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("Male*low_sec","Male*upp_sec","Male*tert"),
        title='first child by education - men (indep hp)')
                                                           
# The estimates are obtained under the hypothesis of independence among 
# factors. We can relax this hp by considering the interaction between 
# factors. The following commands add the interaction between sex and edu.                       
ep2$inter<-ep2$sex:ep2$edu
ch1.ap<-ageprofile(formula=~sex+edu+mar+inter, epdata=ep2, 
        tr.name="First child", agelimits=c(15,50))
                          
# Plot age profile for the interaction between sex and level of education      
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
      lev=c("Female:low_sec","Female:upp_sec","Female:tert"),
      title='first child by education - women')      
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
      lev=c("Male:low_sec","Male:upp_sec","Male:tert"),
      title='first child by education - men')
      
}
\keyword{smooth}
\keyword{age|profiles}
\keyword{transition|rates}
