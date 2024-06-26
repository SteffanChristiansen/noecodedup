#' Title
#'
#' @param directory
#'
#' @return standard folder structure
#' @export
#'
#' @examples
#' create_folder_structure(getwd())
create_folder_structure <- function(directory){
  dir.create("scripts")
  dir.create("data")
  dir.create("reports")
  dir.create("doc")
  dir.create("results")
  dir.create("results/tables")
  dir.create("results/images")
  dir.create("results/processed")
  file.create(".gitignore.txt")
  writeLines(c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata",
               "data/", "reports/", "results/", "doc/"),
             ".gitignore.txt")
  file.copy(from = "scripts/template.Rmd", to = file.path(directory, "scripts", "temp.Rmd"))
}

