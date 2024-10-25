library(shiny)
library(ggplot2)
library(melbWeather)
library(rlang)
library(bslib)
library(dplyr)


data("weather_data")


the_theme <- bs_theme(
  bg = "#f7f7f7",         # background color
  fg = "#333333",         # ext color
  base_font = font_google("Lato"), #Base font
  heading_font = font_google("Merriweather")  # Font for headers
)

weather_data <- weather_data |>
  mutate(
    month = as.integer(month),
    day = as.integer(day),
    date = as.Date(paste(year, month, day, sep = "-"))
  )

# UI for the Shiny app
ui <- fluidPage(
  theme = the_theme,
  includeCSS("www/styles.css"),
  titlePanel("Melbourne Temperature Analysis"),
  sidebarLayout(
    sidebarPanel(
      class = "custom-sidebar",
      selectInput(
        inputId = "variable",
        label = "Select Temperature Type",
        choices = c(
          "Minimum Temperature" = "minimum_temperature_degree_c",
          "Maximum Temperature" = "maximum_temperature_degree_c"
        )
      ),
      dateRangeInput(
        inputId = "date_range",
        label = "Select Date Range",
        start = "2022-01-01",
        end = "2024-12-31"
      ),
        helpText("Use the inputs above to filter the data and visualise temperature trends.", style = "color: white !important;")
    ),
    mainPanel(
      plotOutput("tempPlot"),
      tableOutput("summaryTable"),
      br(),
      div(
        class = "custom-box",
        h4("Description of the Data"),
        p("The dataset includes daily minimum and maximum temperatures recorded in Melbourne from 2022 to 2024."),
        p("The 'Minimum Temperature' and 'Maximum Temperature' fields represent the respective daily temperature readings in degrees Celsius.")
      ),
      div(
        class = "custom-box",
        h4("How to Interpret the Outputs"),
        p("The plot displays the selected temperature trend over the specified date range. Use the table below to view summary statistics of the selected temperature variable.")
      )
    )
  )
)

# Server logic for the Shiny app
server <- function(input, output) {
  filtered_data <- reactive({
    weather_data |>
      filter(
        as.Date(paste(year, month, day, sep = "-")) >= input$date_range[1] &
          as.Date(paste(year, month, day, sep = "-")) <= input$date_range[2]
      )
  })

  # Render the temperature plot
  output$tempPlot <- renderPlot({
    data <- filtered_data()

    ggplot(data, aes(
      x = as.Date(paste(year, month, day, sep = "-")),
      y = !!sym(input$variable)
    )) +
      geom_line(color = "#d9534f") +
      labs(
        title = paste("Melbourne Temperature Trend:", input$variable),
        x = "Date",
        y = "Temperature (°C)"
      ) +
      theme_minimal(base_family = "Lato") +
      theme(
        plot.title = element_text(face = "bold", size = 18, color = "#005b96"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)
      )
  })

  # Render the summary table
  output$summaryTable <- renderTable({
    summary_stats <- summary(filtered_data()[[input$variable]])
    summary_df <- data.frame(
      Statistic = names(summary_stats),
      Value = as.numeric(summary_stats)
    )
    summary_df
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
