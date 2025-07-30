#' Check server status
#' @return API version info if reachable
#' @export
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
