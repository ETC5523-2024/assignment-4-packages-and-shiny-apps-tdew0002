
<!-- README.md is generated from README.Rmd. Please edit that file -->

# melbWeather

<!-- badges: start -->
<!-- badges: end -->

The melbWeather package provides tools to analyze and visualize
Melbourne’s weather data, including minimum and maximum temperature
trends over time. It is designed for students and analysts looking to
explore temperature patterns in a user-friendly way using R and Shiny.

## Installation

You can install the development version of melbWeather from GitHub with:
[GitHub](https://github.com/ETC5523-2024/assignment-4-packages-and-shiny-apps-tdew0002)
with:

``` r
# Install the 'remotes' package if you haven't already
install.packages("remotes")
remotes::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-tdew0002")
```

## Vignettes

For a detailed tutorial and examples on how to use melbWeather, check
out the vignette:

``` r
# View the vignette after installing the package
vignette("melbWeather-introduction")
```

The vignette provides step-by-step instructions on how to clean weather
data, use the interactive Shiny app, and perform analyses with the
melbWeather package.

## Usage

This is a basic example that demonstrates how to use the melbWeather
package to load data and launch the interactive Shiny app:

``` r
library(melbWeather)

# Load Melbourne weather data
data("weather_data")

# Display the first few rows of the data
head(weather_data)
```

## Launch the Shiny App

To explore Melbourne’s weather data interactively, you can launch the
Shiny app included in the package:

``` r
# Launch the Shiny app
startApp()
```

## Example Analysis

Here is an example of summarising a basic dataset:

``` r
summary(weather_data$minimum_temperature_degree_c)
```

You can also embed plots, for example:

``` r
library(ggplot2)
ggplot(weather_data, aes(x = as.Date(paste(year, month, day, sep = "-")), y = minimum_temperature_degree_c)) +
  geom_line(color = "#005b96") +
  labs(
    title = "Minimum Temperature Trend in Melbourne",
    x = "Date",
    y = "Temperature (°C)"
  ) +
  theme_minimal()
```

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

## License

This package is licensed under the MIT License. See the LICENSE file for
more information.

### Explanation of the Key Sections

- **Installation**: Provides instructions for installing the package
  using `pak`, which simplifies the installation of development versions
  from GitHub.
- **Vignette Section**: Added a new section titled *Vignettes* with
  instructions on how to access the vignette:

``` r
vignette("melbWeather-introduction")
```

- **Usage**: Shows how to load the package, access the data, and use the
  core function (`startApp()`).
- **Launch the Shiny App**: Mentions how to use the interactive Shiny
  app, encouraging users to explore the data visually.
- **Example Analysis**: Includes examples that showcase the dataset and
  plots, giving users a clear idea of what they can achieve with the
  package.
- **License**: Standard sections that encourage contributions and
  clarify the package’s license.