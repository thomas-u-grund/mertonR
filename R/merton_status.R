#' Check Merton Server Status
#'
#' Sends a request to the `/api/version` endpoint of the Merton (Ollama) server to check if the server is reachable and authorised.
#'
#' @return A list with version information if the server is reachable. An error is thrown otherwise.
#' @export
#'
#' @examples
#' merton_status()
merton_status <- function() {
  cfg <- get_merton_config()
  res <- httr::GET(
    url = paste0(cfg$url, "/api/version"),
    httr::add_headers(Authorization = paste("Bearer", cfg$key))
  )
  if (httr::status_code(res) == 200) {
    return(httr::content(res, "parsed"))
  } else {
    stop("Server not reachable or unauthorized.")
  }
}
