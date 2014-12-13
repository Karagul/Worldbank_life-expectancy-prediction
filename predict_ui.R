
library(shiny)



shinyUI(fluidPage(
  
  titlePanel('Predicted Life Expectancy'),
  
  sidebarLayout(
    sidebarPanel(
      p(
        'There are a number of factors involved in human life expectancy, especially predicting average life expectancy in the future. By using the data available from the World Bank, we can observe life expectancy values by country over the years and make predictions on what life expectancy will be in the future.'
      ),
      h3(
        'Instructions'
      ),
      p(
        'Select a country of interest and what year you want to view the predicted life expectancy.'
      ),
      selectInput(
        'country',
        'Choose a Country',
        choices = levels(life$country),
        selected = 'China'
      ),
      sliderInput(
        'year',
        'Choose a Year',
        min = 2015,
        max = 2030,
        value = 2015,
        step = 1,
        format = '####'
      )
    ),
    mainPanel(
      plotOutput('lifePlot'),
      h3(textOutput('predicted_expectancy')),
      p(textOutput('prediction_confidence'))
    )
  )
))
