#' List available models on the server
#' @return A list of model tags
#' @export
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
