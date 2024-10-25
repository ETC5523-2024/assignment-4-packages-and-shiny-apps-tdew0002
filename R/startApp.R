#' Launch the Melbourne Temperature Shiny App
#'
#' This function launches the Shiny app for exploring Melbourne temperature data.
#' @export
startApp <- function() {
  shiny::runApp(system.file("shinyapp", package = "melbWeather"))
}
