exp=read.csv("expectancy.csv")

regress <- function(ym, xm, dataDF){
  print("in regress")
  print("ym=")
  print(ym)
  print("xm=")
  print(xm)
  fit <- lm(ym~xm, dataDF)
  print("fit=")
  print(fit)
  return(fit)
}

#input parameters
c1 <- "GDP.per.capita"
c2 <- "life.expectancy.total."
 

myDataCountry <- subset(exp)
