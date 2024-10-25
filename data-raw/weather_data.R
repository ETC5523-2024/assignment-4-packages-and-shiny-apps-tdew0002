library(melbWeather)
library(usethis)

# Clean the data using your function
weather_data <- clean_weather_data(
  "data-raw/melbourne_weather_min.csv",
  "data-raw/melbourne_weather_max.csv"
)

usethis::use_data(weather_data, overwrite = TRUE)

