#' List all branches within a Repo.
#'
#' @param repo Repository name
#' @param project DevOps Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @return Dataframe
#' @keywords Branches
#' @export
#' @examples
#' \dontrun{
#' list_branches("supply-index", "sub-national-supply", "teachers-analysis-unit", auth)
#' }

list_branches <- function(repo, project, domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/", project, "/_apis/git/repositories/", repo, "/refs?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    .data$value

}
