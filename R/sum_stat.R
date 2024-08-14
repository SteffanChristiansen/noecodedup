#' Summary statistics
#'
#' @param df A data.frame with values that needs to be summarised
#' @param variables Selected columns from the data.frame
#'
#' @return Minimum, median and maximum values of selected variables
#' @import dplyr
#' @export
#'
#' @description sum_stat returns summary statistics of selected variables
#' from a data frame
#'
#'
#' @examples
#' sum_stat(mtcars, dplyr::everything())

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

  summaries <- summaries %>%
    mutate(measures = c("minimum", "median", "maximum")) %>%
    select(measures, dplyr::everything())
  return(summaries)
}

