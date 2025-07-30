#' Query the Merton (Ollama) Server
#'
#' Sends a prompt to the remote Merton (Ollama) server and returns the generated response.
#'
#' @param prompt A character string with your query (e.g., a question or task).
#' @param model A string indicating the model to use (default is `"gemma3:1b"`).
#'
#' @return A character string containing the model's response.
#' @export
#'
#' @examples
#' \dontrun{
#'   set_merton_config("http://localhost:11434", "your-api-key")
#'   query_merton("What is sociology?")
#' }
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
