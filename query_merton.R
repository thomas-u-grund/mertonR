#' Query the Merton (Ollama) Server
#' @param prompt Prompt to send
#' @param model Model to use (default = "gemma3:1b")
#' @return Text response
#' @export
query_merton <- function(prompt, model = "gemma3:1b") {
  cfg <- get_merton_config()

  res <- httr::POST(
    url = paste0(cfg$url, "/api/generate"),
    httr::add_headers(Authorization = paste("Bearer", cfg$key)),
    body = list(
      model = model,
      prompt = prompt,
      stream = FALSE
    ),
    encode = "json"
  )

  if (httr::status_code(res) == 200) {
    parsed <- httr::content(res, as = "parsed", simplifyVector = TRUE)
    return(parsed$response)
  } else {
    stop("❌ Request failed: ", httr::status_code(res))
  }
}
