scol_names <- function(col_names) {
  col_names <- str_replace_all(
    col_names,
    c(" \\| " = "_",
      " - " = "_",
      " " = "_",
      "|" = "",
      "-" = "_",
      ":" = "",
      "\\(" = "",
      "\\)" = "",
      "\\+" = "_")) %>%
    tolower()
  return(col_names)
}
