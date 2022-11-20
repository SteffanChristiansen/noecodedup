#' Scroll tables
#'
#' @param dataframe
#'
#' @return A scroll table
#' @export
#'
#' @description scroll_table() converts a input table to a scroll table.
#'
#'
#' @examples
#' x <- data.frame(x = c(1, 2), y = c(4, 2))
#' scroll_table(x)
scroll_table <- function(dataframe) {
  knitr::kable(dataframe) |>
    kableExtra::kable_styling("striped",
                              full_width = FALSE,
                              font_size = 14) |>
    kableExtra::scroll_box(width = "800px", height = "200px")
}
