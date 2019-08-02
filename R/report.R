#' Creates an html report summarising all projects and repos for DevOps Site.
#'
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @param output_file Name of output file
#' @param output_dir Name of output directory
#' @return HTML Report
#' @keywords Branches
#' @export
#' @examples
#' \dontrun{
#' generate_status_report("teachers-analysis-unit", auth)
#' }

generate_status_report <- function(domain, auth, output_file = "azuredevops_status_report.html", output_dir = "."){

  rmarkdown::render(system.file("rmd","azuredevops_status_report.Rmd", package = "azuredevopsR"), output_file = output_file, output_dir = output_dir, params = list(domain = domain, auth = auth))

}
