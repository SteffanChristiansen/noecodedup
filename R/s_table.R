#' Simple tables
#'
#' @param data.frame
#'
#' @return A table in kable format
#' @export
#'
#' @description s_table() converts a input table to a table for visualization
#' in rmarkdown format.
#'
#' @examples
#' x <- data.frame(x = c(1, 2), y = c(4, 2))
#' s_table(x)
s_table <- function(dataframe) {
  knitr::kable(dataframe) |>
    kableExtra::kable_styling(bootstrap_options = c("condensed", "striped"),
                              full_width = FALSE,
                              font_size = 14)
}
