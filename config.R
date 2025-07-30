#' Set Merton API Configuration
#'
#' Saves the Merton API server URL and API key to a hidden file in the user's home directory (`~/.merton`).
#'
#' @param url The URL of the Merton server (e.g., "http://134.130.156.55:8080").
#' @param api_key The API key for authenticating requests.
#'
#' @return No return value. Writes config to a file and prints a message.
#' @export
#' @name set_merton_config
#'
#' @examples
#' set_merton_config("http://134.130.156.55:8080", "your-api-key")
#' query_merton("What is sociology?")
set_merton_config <- function(url, api_key) {
  config_path <- fs::path_expand("~/.merton")
  writeLines(c(url, api_key), config_path)
  message("Config saved to ~/.merton")
}
#' Get Merton API Configuration
#'
#' Reads the Merton server URL and API key from the config file stored at `~/.merton`.
#'
#' @return A list with two elements: `url` and `key`.
#' @export
#' @name get_merton_config
#'
#' @examples
#' config <- get_merton_config()
#' config$url
#' config$key
get_merton_config <- function() {
  config_path <- fs::path_expand("~/.merton")
  if (!file.exists(config_path)) stop("No config file found. Run set_merton_config().")
  lines <- readLines(config_path)
  list(url = lines[1], key = lines[2])
}
