\name{mkdate}
\alias{mkdate}
\title{Compute dates.}
\description{
Computes dates in continuous years or CMC (Century Month Code) since January 1, 1900.
}
\usage{mkdate(year, month, cmc = FALSE)}
\arguments{
  \item{year}{
a vector containing the year of a date(XXXX format)
}
  \item{month}{
a vector containing the month of a date (XX format) 
}
  \item{cmc}{
if TRUE date in CMC from January 1, 1900 is computed. Otherwise, date in continuos time
since January 1, 1900 is computed.
}
}

\value{a vector containing dates in continuous time or CMC.}
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility), 
DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}
\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}

\examples{
dy<-c(1996,2001,2005,2003)
dm<-c(3,9,5,12)
mkdate(year=dy,month=dm)
mkdate(year=dy,month=dm, cmc=TRUE)
} 
\keyword{dates}
