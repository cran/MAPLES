\name{listvar}
\alias{listvar}
\title{Shows variables in a dataframe.}
\description{Shows variables in a dataframe and the related number of column.}
\usage{listvar(df)}

\arguments{
  \item{df}{is the dataframe.}
}

\value{
a dataframe with two columns: VAR containing the names of the variables and COL
with the number of related column in the original dataframe. 
}

\author{Roberto Impicciatore
\email{roberto.impicciatore@unimi.it}
}
\examples{
listvar(demogr)
} 
