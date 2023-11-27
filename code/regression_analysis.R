path <- "C:/Users/Owner/Documents/Python-Scripts/mkt_research/Phase2_mkt_research/regression_data.csv"

data <- read.table(file=path,sep=',',header=TRUE)
attach(data)
summary(data)
#alpha = .05
plot(AI.Trust.Score~Q13,xlab="amount spend in last 3 months",ylab = "AI Trust Score")
abline(a=mean(AI.Trust.Score),b=0,col="green")


#X is the number of possible retained customers, based on response.
o_zero<-lm(AI.Trust.Score~X,data)
summary(o_zero)
#p-value = 0.124
#Multiple R-squared:  0.004509,	Adjusted R-squared:  0.00261 


#Q13 = how much was spent in the last 3 months.
o1<-lm(AI.Trust.Score~Q13,data)
summary(o1)
#p-value = 0.147 
#Multiple R-squared:  0.004003,	Adjusted R-squared:  0.002102 


o2<-lm(AI.Trust.Score~Q13+X,data)
summary(o2)

abline(a=o1,b=0,col='red')


#forward building the model:
f1<-lm(AI.Trust.Score~Q13+factor(Q1),data)
summary(f1)
#Multiple R-squared:  0.01401,	Adjusted R-squared:  0.0006812
#f1 model is not a better model than o_zero,o1,o2

#Does our model explain our data better than the mean of our data? No,not really.
