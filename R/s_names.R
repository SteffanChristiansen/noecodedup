#' Simple names
#'
#' @param names
#'
#' @return A character vector
#' @export
#'
#' @description s_names() removes symbols such as parentheses and colons and
#' substitute symbols (|, :, and +) with underscores. No letters are capitalized.
#'
#' @examples
#' x <- c("x (1)", "X 2", "X - 3", "X:4")
#' s_names(x)
s_names <- function(names) {
  names <- stringr::str_replace_all(
    names,
    c(" \\| " = "_",
      " - " = "_",
      " " = "_",
      "|" = "",
      "-" = "_",
      ":" = "",
      "\\(" = "",
      "\\)" = "",
      "\\+" = "_")) |>
    tolower()
  return(names)
}
