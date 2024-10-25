#' Clean Melbourne Weather Data
#'
#' Merges and cleans Melbourne weather data from minimum and maximum temperature files.
#'
#' @param min_data_path The path to the minimum temperature CSV file.
#' @param max_data_path The path to the maximum temperature CSV file.
#' @return A cleaned data frame with the columns: year, month, day, minimum_temperature_degree_c, maximum_temperature_degree_c.
#' @export
clean_weather_data <- function(min_data_path, max_data_path) {
  library(tidyverse)
  library(janitor)

  weather_data_min <- read_csv("data-raw/melbourne_weather_min.csv")
  weather_data_max <- read_csv("data-raw/melbourne_weather_max.csv")

  weather_data <- merge(
    weather_data_min,
    weather_data_max,
    by = c("Year", "Month", "Day", "Quality")) |>
    rename_all(janitor::make_clean_names) |>
    select(
      year,
      month,
      day,
      minimum_temperature_degree_c,
      maximum_temperature_degree_c
    )

  return(weather_data)
}
