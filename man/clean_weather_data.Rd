% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_cleaning.R
\name{clean_weather_data}
\alias{clean_weather_data}
\title{Clean Melbourne Weather Data}
\usage{
clean_weather_data(min_data_path, max_data_path)
}
\arguments{
\item{min_data_path}{The path to the minimum temperature CSV file.}

\item{max_data_path}{The path to the maximum temperature CSV file.}
}
\value{
A cleaned data frame with the columns: year, month, day, minimum_temperature_degree_c, maximum_temperature_degree_c.
}
\description{
Merges and cleans Melbourne weather data from minimum and maximum temperature files.
}
