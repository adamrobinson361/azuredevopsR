#' List all repos within a project
#'
#' @param project DevOps Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @return Dataframe
#' @keywords Repos, Projects
#' @export
#' @examples
#' \dontrun{
#' list_repos("sub-national-supply", "teachers-analysis-unit", auth)
#' }

list_repos <- function(project, domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/", project, "/_apis/git/repositories?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    .data$value

}
