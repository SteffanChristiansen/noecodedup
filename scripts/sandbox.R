# doc: https://r-pkgs.org/whole-game.html
library(devtools)
# load_all()
library(tidyverse)

# document()
# exists("scol_names", where = globalenv(), inherits = FALSE)
# ?s_names
#
# check()
# install()


x <- data.frame(a = c(1, 2),
                b = c(4, 2),
                c = c(1,2),
                d = c(1,2))
colnames(x) <- c("COL 1", "col 2", "col-3", "#col 4")


# s_names <- function(df) {
#   colnames(df) <- stringr::str_replace_all(
#     colnames(df),
#     c(" \\| " = "_",
#       " - " = "_",
#       " " = "_",
#       "|" = "",
#       "-" = "_",
#       ":" = "",
#       "\\(" = "",
#       "\\)" = "",
#       "\\+" = "_",
#       "#" = "")) |>
#     tolower()
#   return(df)
# }
# s_names(x)
