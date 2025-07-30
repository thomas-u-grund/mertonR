set_merton_config <- function(url, api_key) {
  config_path <- fs::path_expand("~/.merton")
  writeLines(c(url, api_key), config_path)
  message("Config saved to ~/.merton")
}

get_merton_config <- function() {
  config_path <- fs::path_expand("~/.merton")
  if (!file.exists(config_path)) stop("No config file found. Run set_merton_config().")
  lines <- readLines(config_path)
  list(url = lines[1], key = lines[2])
}
