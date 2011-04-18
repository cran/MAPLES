\name{epdata}
\alias{epdata}
\title{Prepares episode data for event history analysis.}
\description{Starting from a micro-level dataset containing dates for some 
relevant events, it prepares a file with an episode-data format suitable for 
event history analysis.}
\usage{epdata(start, event, lcensor, rcensor, 
              subset = TRUE, birth, id, addvar)
}
\arguments{
  \item{start}{a vector of dates at which the unit starts to be at risk to experience 
      the transition. It may be unknown in case of left-censoring. When the episode 
      is no left censored, start coincides with the beginning of the episode.}
  \item{event}{a vector of containing the date of the event of interest. It may 
      be unknown in case of right-censoring.}
  \item{lcensor}{an optional vector  of left censoring dates.}
  \item{rcensor}{an optional vector of right censoring dates.}
  \item{subset}{a logical expression indicating elements or rows to keep. 
      It specifies the subset of cases at risk of experiencing the event of interest.
      If TRUE, the whole sample will be considered.}
  \item{birth}{a vector containing the respondent date of birth. 
      This information in useful in order to compute ages at various events (NA not allowed).}
  \item{id}{a vector of identification numbers. If id remains unspecified, a 
      default id is implemented.}  
  \item{addvar}{a dataframe containing additional variables to add in the resulting output.}         
}
\details{All the specified objects must have the same length (i.e. the number of 
      cases must be the same). For any observation at least one between start and 
      lcensor and one between event and rcensor must be known. In general, we have 
      start<=lcensor<= event<=rcensor.}
\value{A data.frame suitable for MAPLES and R survival package. Following the 
      'counting process' formulation of survival analysis, each record ha the 
      following variables:
\item{Tstart}{episode starting date}
\item{Tstop}{episode ending date}
\item{status}{0: right censored: 1: event occurred: 2: left censored: 3: interval censored. 
      Is equal to 1 if and only if the date of the event precedes the date of right censoring.}
\item{Agestart}{Age at starting date (Tstart)}
\item{Agestop}{Age at the ending date (Tstop)}
}
\references{Impicciatore R. and Billari F.C., (2010), MAPLES: a general method for the 
estimation of age profiles from standard demographic surveys (with an application to fertility), 
DEAS WP, \cr
http://ideas.repec.org/p/mil/wpdepa/2010-40.html}
\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}
\seealso{
\code{\link{splitter}},
\code{\link{ageprofile}},
\code{\link{plotap}}
}
\examples{
# creates an episode-data structure relating 
# to the transition childless-->first child
ep1<-epdata(start=demogr$dbirth, 
            event=demogr$dch1,
            rcensor=demogr$dint,
            birth=demogr$dbirth,
            id=demogr$id,
            addvar=subset(demogr,select=c(-id,-dbirth)))    
                 
# or, using 'with'
ep1<-with(demogr,epdata(start=dbirth, event=dch1, 
          rcensor=dint, birth=dbirth,id=id,
          addvar=subset(demogr,select=c(-id,-dbirth))))
}
\keyword{datagen}
\keyword{episode data}
\keyword{event history analysis}
\keyword{survival}

