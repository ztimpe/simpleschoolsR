% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addresses.R
\name{clean_addresses}
\alias{clean_addresses}
\title{clean_addresses}
\usage{
clean_addresses(.data, var, vec_of_strings = NULL)
}
\arguments{
\item{.data}{The data frame that is intended for modification.}

\item{var}{The column of school address that will be modified.}

\item{vec_of_strings}{Optional vector of character strings to replace}
}
\value{
clean_addresses returns a data frame with the new column 'clean_address'
in the first position, followed by the original address column, and finally
the rest of the columns. None are dropped. If 'var' is not character, original
data frame is returned.
}
\description{
This function removes and replaces common address pronouns
and abbreviations to prepare for matching.
}
\details{
The addresses functions data and functions are used to simplify the process
of fixing school addresses for the purposes of matching.
}
\note{
returns original data frame if selected column is not character.
}
