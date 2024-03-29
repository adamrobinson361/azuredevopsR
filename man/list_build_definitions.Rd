% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/builds.R
\name{list_build_definitions}
\alias{list_build_definitions}
\title{List all build defintions associated within a project.}
\usage{
list_build_definitions(project, domain, auth)
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
List all build defintions associated within a project.
}
\examples{
\dontrun{
list_build_definitions("sub-national-supply", "teachers-analysis-unit", auth)
}
}
\keyword{Build}
\keyword{Builds}
\keyword{Defs,}
