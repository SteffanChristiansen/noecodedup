
#' Summary statistics
#'
#' @param df
#' @param variables
#'
#' @return Summary statistics of selected variables
#' @import dplyr
#' @export
#'
#' @description sum_stat returns summary statistics of selected variables
#' from a data frame
#'
#'
#' @examples
#'var <- c("mpg", "cyl")
#'sum_stat(mtcars, var)

sum_stat <- function(df, variables) {
  # measures <- c("minimum", "median", "maximum")
  summaries <- bind_rows(
    df %>%
      select(variables) |>
      summarise_all(min),
    df %>%
      select(variables) |>
      summarise_all(median),
    df %>%
      select(variables) |>
      summarise_all(max)
  )
  # bind_cols(data.frame(value = measures, summaries))
}

