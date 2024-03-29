% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/builds.R
\name{list_builds}
\alias{list_builds}
\title{List all current builds within a project.}
\usage{
list_builds(project, domain, auth)
}
\arguments{
\item{project}{DevOps Project Name}

\item{domain}{DevOps Site Name}

\item{auth}{Authentication Key}
}
\value{
Dataframe
}
\description{
List all current builds within a project.
}
\examples{
\dontrun{
get_builds("sub-national-supply", "teachers-analysis-unit", auth)
}
}
\keyword{Builds}
