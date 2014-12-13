

library(shiny)
#life=read.csv("expectancy.csv")

shinyServer(function(input, output) {
  
  output$lifePlot <- renderPlot({
    
    mycountry= subset(life,country==input$country)
    print("mycountry:")
    print(mycountry)
    
    years=mycountry$date
    expectancy=mycountry$life.expectancy.total.
    print("year :")
    print(years)
    print("expectancy :")
    print(expectancy)
    
    fit=lm(expectancy~poly(years,2,raw=TRUE))
    print("fit :")
    print(fit)
    
    predicted_expectancy <- predict(
                          fit,
                          newdata = data.frame(p= c(input$year)),
                          interval = 'confidence'
                        )
    print("predicted_expectancy :")
    print(predicted_expectancy)
                        
                        
   output$predicted_expectancy <- renderText({
                          paste(
                            'Predicted Expectancy:',
                            round(predicted_expectancy[1], digits = 2)
                          )
                        })
   output$prediction_confidence <- renderText({
                          paste(
                            '95% confidence between',
                            round(predicted_expectancy[2], digits = 2),
                            'and',
                            round(predicted_expectancy[3], digits = 2)
                          )
                        })
                        
   years <- c(years, input$year)
   expectancy <- c(expectancy, predicted_expectancy[1])
   print("year2 :")
   print(years)
   print("expectancy2 :")
   print(expectancy)
                        
     plot(years,expectancy, xlab = 'Year',ylab = 'Life Expectancy (in years)')
                        
 
                        
      points( input$year, predicted_expectancy[1],col = 'red',pch = 19)
                        
  })
  
})
