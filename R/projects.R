#' List all projects.
#'
#' @param domain The name of the DevOps Site (short name)
#' @param auth Authentication Variable
#' @return Dataframe
#' @keywords Projects
#' @export
#' @examples
#' \dontrun{
#' list_projects("teachers-analysis-unit", auth)
#' }

list_projects <- function(domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/_apis/projects?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    .data$value

}
