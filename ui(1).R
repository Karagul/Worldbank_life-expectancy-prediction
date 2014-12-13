library(shiny)

shinyUI(fluidPage(
  titlePanel('life_expectancy'),
  
  sidebarLayout(
    sidebarPanel(
      #helpText(""),
      
      checkboxInput("overall","see tendency by years"),
      
      br(),
      
      selectInput("variable",label ="variable",
                  choices=list("GDP.per.capita","Health.expenditure.per.capita","life.expectancy.female.",
                               "life.expectancy.male.","life.expectancy.total."),selected=""),
      
      br(),
      
      checkboxInput("total","compare variables for all cities"),
      
      br(),
      
      selectInput("xvalue",label ="x",
                  choices=list("GDP.per.capita","Health.expenditure.per.capita","life.expectancy.female.",
                               "life.expectancy.male.","life.expectancy.total.","date"),selected=""),
      
      br(),
      
      selectInput("yvalue",label ="y",
                  choices=list("GDP.per.capita","Health.expenditure.per.capita","life.expectancy.female.",
                               "life.expectancy.male.","life.expectancy.total."),selected=""),
      
      br(),
      
      checkboxInput("separate","compare variables for each city"),
      
      selectInput("selectcountry",label = "country",
                  levels(exp$country), selected=""),
      
      br(),
      
      selectInput("comparison1",label ="comparison1",
                  choices=list("GDP.per.capita","Health.expenditure.per.capita","life.expectancy.female.",
                               "life.expectancy.male.","life.expectancy.total."),selected=""),
      
      br(),
      
      selectInput("comparison2",label ="comparison2",
                  choices=list("GDP.per.capita","Health.expenditure.per.capita","life.expectancy.female.",
                               "life.expectancy.male.","life.expectancy.total."),selected="")
      
  
    ),
    
    mainPanel('Output area',
              plotOutput("plot1"))
    
  ))
  
)
