library(shiny)
library(ggplot2)



shinyServer(function(input, output) {
  
   
  output$plot1 <- renderPlot(function(){ 
    
    print("in renderPlot")
    print(paste0("Selected variable is:  ", input$variable))
    print(paste0("Selected x is:  ", input$xvalue))
    print(paste0("Selected y is:  ", input$yvalue))
    print(paste0("Selected Country is:  ", input$selectcountry))
    print(paste0("Selected Comparison1 is:  ", input$comparison1))
    print(paste0("Selected Comparison2 is:  ", input$comparison2))
    c1<<-input$comparison1
    c2<<-input$comparison2
    c3<-input$xvalue
    c4<-input$yvalue
    c5<-input$variable
    print(c1)
    print(c2)
    print(c3)
    print(c4)
    print(c5)
    
    if(input$overall){
      ggplot(exp,aes_string("date",c5))+geom_point()+geom_line(aes(color=country))
    }
    else{
      
    if(input$total){
      ggplot(exp,aes_string(c3,c4))+geom_point()+geom_line(aes(color=country))
    }
    else{
    
    if (input$separate){
    myDataCountry <<- subset(exp, country==input$selectcountry)
    print("myDataCountry:")
    print(myDataCountry)}
   
  
      y <- regress(myDataCountry[[c1]], myDataCountry[[c2]], myDataCountry)
      
    a=y$coefficients[1]
    b=y$coefficients[2]
    print(paste0("a=",a))
    print(paste0("b=",b))
    
  
    ggplot(myDataCountry,aes(y=myDataCountry[[c1]],x=myDataCountry[[c2]]))+xlab(c2)+ylab(c1)+geom_point()+geom_abline(intercept=a, slope=b)
  
    }
    }
    
    
  }) #renderplot
  
}) # shiny server


