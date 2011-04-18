\name{splitter}
\alias{splitter}
\title{Creates a time-varying factor variables within a episode-data.}
\description{
Splits episode in sub-episodes according to the dates specified as input.
 The resulting dataframe contains a new time-varying factor variable with different 
 user-defined values in each subinterval.
}
\usage{splitter(epdata, split, tvar.name = "Tvar", tvar.lev)}
\arguments{
  \item{epdata}{a dataframe containing an episode-data file (obtained through the epdata command)}
  \item{split}{an array containing the date(s) at one (or more) specific event(s) 
  that causes the change in the resulting time-varying variable. The original episode
  will be split at this date(s). If n vectors of dates have been spcified, the original
  episode will be splitted in n+1 subepisodes. For example, let us consider a matrix 
  with three columns containing the dates at the first, second, and third child birth.
  The original episode may be split into (up to) four subepisodes according to non-NA 
  specified dates (see details).}
  \item{tvar.name}{a string containing the name of the time-varying factor 
  variable in the resulting dataframe.}
  \item{tvar.lev}{a vector of n+1 strings containing the level labels of the resulting 
  time-varying variable (where n is the number of columns in the split argument).}
}
\details{
Split dates refer to event that can  be experienced sequentially (first birth, 
second birth, third birth, ecc or first marriage, second marriage, third marriage, etc.).
This implies that  \cr
1. Split dates must be strictly sequential: date1<=date2<=date3<=etc.  \cr
2. NA date cannot be followed by a non-NA date (e.g. for the j-th  the sequence 
of dates "date1,date2, NA" is allowed and it means that event3 has not been 
experienced, whereas "NA, date1, date2"  is not allowed because we do not have 
any information about the first change ). \cr
The number of rows in the split argument must be the same as the number of rows 
in the epdata argument.
}
\value{
In the resulting dataframe each row is a subepisode obtained through the splitting 
procedure. The columns will be the same as the epdata argument plus one time-varying 
factor variable with levels specified through tvar.lev argument. \cr
In order to create several time-varying variables on the same dataframe, splitter 
procedure should be applied repeatedly  for each new time-varying variable. At any 
step the input dataframe will be the resulting dataframe in the previous one.
}
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the estimation 
of age profiles from standard demographic surveys (with an application to fertility), 
DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}

\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}
\seealso{
\code{\link{epdata}},
\code{\link{ageprofile}},
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
# "ever married" (marr)  
ep2<-splitter(ep1,split=ep1$d1marr,tvar.lev=c("not_marr","marr"),
              tvar.name="mar")
}
\keyword{datagen}
\keyword{episode|data}
\keyword{event|history|analysis}
\keyword{survival}
\keyword{episode|splitting}
