#' Simple names
#'
#' @param df
#'
#' @return A df with simple column names
#' @export
#'
#' @description s_names() removes symbols such as parentheses and colons and
#' substitute symbols (|, :, and +) with underscores. No letters are capitalized.
#'
#' @examples
#' x <- data.frame(x = c(1, 2), y = c(4, 2), z = c(1,2))
#' colnames(x) <- c("COL (1)", "col:2", "col-3")
#' x
#' s_names(x)

s_names <- function(df) {
  colnames(df) <- stringr::str_replace_all(
    colnames(df),
    c(" \\| " = "_",
      " - " = "_",
      " " = "_",
      "|" = "",
      "-" = "_",
      ":" = "",
      "\\(" = "",
      "\\)" = "",
      "\\+" = "_",
      "#" = "")) |>
    tolower()
  return(df)
}
