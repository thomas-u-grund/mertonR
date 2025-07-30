#' List Available Models on the Merton Server
#'
#' Queries the Merton server for a list of available model tags.
#'
#' @return A list of model tags returned by the server.
#' @export
#' @name merton_model_info
#'
#' @examples
#' \dontrun{
#'   set_merton_config("http://localhost:11434", "your-api-key")
#'   merton_model_info()
#' }
merton_model_info <- function() {
  cfg <- get_merton_config()
  res <- httr::GET(
    url = paste0(cfg$url, "/api/tags"),
    httr::add_headers(Authorization = paste("Bearer", cfg$key))
  )
  if (httr::status_code(res) == 200) {
    return(httr::content(res, "parsed"))
  } else {
    stop("Failed to retrieve model list.")
  }
}
