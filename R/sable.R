sable <- function(x) {
  kable(x) %>%
    kable_styling(bootstrap_options = c("condensed", "striped"),
                  full_width = FALSE,
                  font_size = 14)
}
