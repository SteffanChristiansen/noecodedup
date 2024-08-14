# doc: https://r-pkgs.org/whole-game.html
library(devtools)
# library(tidyverse)



# use_r("sum_stat") # convert function into new .R file
load_all()



# use_mit_license() # adding licence
document()
# check 1.12 for man page for new functions

use_package("")
# 1.16 - packages that are imported

# use_git()


check()
install()


# x <- data.frame(a = c(1, 2),
#                 b = c(4, 2),
#                 c = c(1,2),
#                 d = c(1,2))
# colnames(x) <- c("COL 1", "col 2", "col-3", "#col 4")





# FIX SUM_STAT ------------------------------------------------------------
# wrong order of labels!

df<-mtcars %>% group_by(gear)
variables <- "cyl"

# summaries <- bind_rows(
#   df %>%
#     select(all_of(variables)) |>
#     summarise_all(min),
#   df %>%
#     select(all_of(variables)) |>
#     summarise_all(median),
#   df %>%
#     select(all_of(variables)) |>
#     summarise_all(max))

summaries <- tibble(
  min = df %>%
    select(all_of(variables)) |>
    summarise_all(min),
  median = df %>%
    select(all_of(variables)) |>
    summarise_all(median),
  max = df %>%
    select(all_of(variables)) |>
    summarise_all(max))

summaries

