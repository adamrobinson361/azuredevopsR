#' Create Authentication Key to be used with all API calls.
#'
#' @param username The email registered with Azure DevOps
#' @param key Password or PAT Code
#' @return Authentication Key
#' @keywords Authenticate
#' @export
#' @examples
#' \dontrun{
#' create_authentication_key("adam.robinson@education.gov.uk")
#' }

create_authentication_key <- function(username, key = rstudioapi::askForSecret("Key")){

  paste("Basic", RCurl::base64(paste(username, key, sep = ":")))

}
