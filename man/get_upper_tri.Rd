% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/correlations.r
\name{get_upper_tri}
\alias{get_upper_tri}
\title{Get upper triangle of a correlation matrix}
\usage{
get_upper_tri(cormat)
}
\arguments{
\item{cormat}{Correlation matrix}
}
\value{
Upper triangle of matrix, lower is NA
}
\description{
Get upper triangle of a correlation matrix
}
\examples{
get_upper_tri(stats::cor(matrix(rnorm(500), 100, 5)))
}
