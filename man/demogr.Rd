\name{demogr.RData}
\alias{demogr.RData}
\alias{demogr}
\docType{data}
\title{Longitudinal data on marriage and first child birth.}
\description{
Longitudinal data on marriage and first child birth. Individuals interwieved
in March 2004.
}
\usage{demogr}
\format{
A data frame with 2017 observations on 8 variables.

[,1]  id      integer	 ID \cr
[,2]  weight  numeric	 Individual weight \cr
[,3]  dbirth  numeric	 respondent's date at birth \cr 
[,4]  dint    numeric	 date at the interview \cr
[,5]  d1marr  numeric	 date at marriage \cr
[,6]  dch1    numeric  date at first child birth \cr
[,7]  sex     factor	 sex  \cr
[,8]  edu     factor   level od efucation \cr

}
\details{
Individuals were interviewed at the end of 2003 retrospectively on family and 
fertility life trajectory.  \cr 

id: individual identification number (ID) \cr
weight: individual post-sampling weight (with mean = 1) \cr
dbirth: respondent's date at birth in exact years since January 1, 1900 \cr
dint: date at the interview in exact years since January 1, 1900 (March 2004 
for all respondents)   \cr
d1marr: date at marriage (if any) in exact years since January 1, 1900. If NA, 
the individual has never been married before the interview. \cr
dch1: date at marriage (if any) in exact years since January 1, 1900. If NA, 
the individual is childless at the interview. \cr
sex: respondent's sex (factor w/2 levels: "Male", "Female") \cr
edu: respondent's level of education (factor w/3 levels: "low_sec","upp_sec","tert") \cr 

Dates in exact years have been computed considering the midpoint of a specific month.
Thus, March 1995 means March 15, 1995 and the date in exact years is 95+2.5/12=95.21.
}
\source{
Synthetic data based on the format of the Generation and Gender Survey (GGS) (Vikat et al. 2007). 
}
\references{
Vikat A., Speder Z., Beets G., Billari F.C., Buhler C., Desesquelles A., Fokkema T., 
Hoem J., MacDonald A., Neyer G., Pailhe A., Pinnelli A., Solaz A. (2007). 
"Generations and Gender Survey (GGS): Toward a better understanding of relationship 
and processes in the life course", Demographic research, 17 (14): 389-440. 
\cr 
\cr
Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility), DEAS WP,\cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}
\examples{
str(demogr)
}
\keyword{datasets}
