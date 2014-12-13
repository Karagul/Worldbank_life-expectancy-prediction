life=read.csv("expectancy.csv")

# this data has 252 rows
n=nrow(life)
#use 70% of the data to get my regression model
n1=round(n*0.7)    #176
# look at the first few
head(life)
# splitdf function will return a list of training and testing sets
splitdf <- function(data, seed=NULL) {
  if (!is.null(seed)) set.seed(seed)
  index <- 1:nrow(data)
  trainindex <- sample(index,n1)
  trainindex2 <- sample(index,n1)
  trainset <- data[trainindex, ]
  testset <- data[-trainindex2, ]
  list(trainset=trainset,testset=testset)
}
#apply the function
splits <- splitdf(life)

#it returns a list - two data frames called trainset and testset
str(splits)

# there are 176,76 observations in each data frame
lapply(splits,nrow)

#view the first few columns in each data frame
lapply(splits,head)

# save the training and testing sets as data frames
training <- splits$trainset
testing <- splits$testset


#gain regression model
fit<-lm(life.expectancy.total.~GDP.per.capita+Health.expenditure.per.capita,data=training)
summary(fit)
par(mfrow=c(2,2))
plot(fit)

#test of multicollinearity
fit2<-lm(GDP.per.capita~Health.expenditure.per.capita,data=training)
summary(fit2)
Rsq=summary(fit2)$r.squared   #0.5017695
vif=1/(1-Rsq)   #2.007103

#testing(use the 30% left data to test my model)
#get the number of data
n=nrow(testing)    #76
#get sum of error
testing["predict"]=1.722e-04*testing$GDP.per.capita +3.264e-03*testing$Health.expenditure.per.capita+6.703e+01
testing["difference"]=testing$predict-testing$life.expectancy.total.
testing["square_of_error"]=(testing["difference"])^2
a=sum(testing$square_of_error)   #SSE= 837.1791
#get MSE
MSE=a/(n-2-1)    # MSE=11.46821
#get sum of total
testing["square_of_total"]=(testing$life.expectancy.total.-mean(testing$life.expectancy.total.))^2
b=sum(testing$square_of_total)   #SST=2957.922
MST=b/(n-1)       #MST=39.43897
#get sum of regression
c=b-a  #SSR= 2120.743
MSR=c/2     #MSR=1060.372
#get F statistics
F=MSR/MSE  #92.46185
#get p value
p_value=1-pf(92.46185,2,73)   # 0

