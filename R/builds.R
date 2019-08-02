#' List all build defintions associated within a project.
#'
#' @param project DevOps Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @return Dataframe
#' @keywords Build Defs, Builds
#' @export
#' @examples
#' \dontrun{
#' list_build_definitions("sub-national-supply", "teachers-analysis-unit", auth)
#' }

list_build_definitions <- function(project, domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/", project, "/_apis/build/definitions?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    .data$value

}

#' Get build defintion.
#'
#' @param definitionid Build Definition ID
#' @param project DevOps Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Ket
#' @return JSON Definition
#' @keywords Build Defs, Builds
#' @export
#' @examples
#' \dontrun{
#' get_build_definition(1, "sub-national-supply", "teachers-analysis-unit", auth)
#' }

get_build_definition <- function(definitionid, project, domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/", project, "/_apis/build/definitions/", definitionid, "?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::prettify()

}

#' List all current builds within a project.
#'
#' @param project DevOps Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @return Dataframe
#' @keywords Builds
#' @export
#' @examples
#' \dontrun{
#' get_builds("sub-national-supply", "teachers-analysis-unit", auth)
#' }

list_builds <- function(project, domain, auth){

  url <- paste0("https://dev.azure.com/",domain,"/", project, "/_apis/build/builds?api-version=5.0")

  response <- httr::GET(url, httr::add_headers(Authorization = auth))

  httr::content(response,as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    .data$value

}

#' Queue a build based on existing definition.
#'
#' @param definitionid Build definition ID
#' @param project Project Name
#' @param domain DevOps Site Name
#' @param auth Authentication Key
#' @return Dataframe
#' @keywords Builds
#' @export
#' @examples
#' \dontrun{
#' queue_build(1, "sub-national-supply", "teachers-analysis-unit", auth)
#' }

queue_build <- function(definitionid, project, domain, auth){

  uri <- paste0("https://dev.azure.com/", domain,"/", project, "/_apis/build/builds?api-version=5.0")

  content_body <- jsonlite::toJSON(list(definition = list(id = definitionid)), auto_unbox = TRUE)

  httr::POST(uri, httr::add_headers(Authorization = auth), httr::content_type("application/json"), body = content_body)

}

