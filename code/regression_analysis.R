path <- "C:/Users/Owner/Documents/Python-Scripts/mkt_research/Phase2_mkt_research/data/regression_data.csv"

data <- read.table(file=path,sep=',',header=TRUE)
attach(data)
summary(data)


####################################################################################
#correlation - data is normally distributed, Pearson's correlation
cor.test(Q13,AI.Trust.Score,method=c('pearson'))
cor.test(X,AI.Trust.Score,method=c('pearson'))
#Pearson's product-moment correlation
#
#data:  X and AI.Trust.Score
#t = -1.5407, df = 524, p-value = 0.124
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#  -0.15177443  0.01844818
#sample estimates:
#        cor  = -0.06715175 


#####################################################################################
#regression
#alpha = .05
#X is the number of possible retained customers, based on response.
o_zero<-lm(AI.Trust.Score~X,data)
summary(o_zero)
plot(AI.Trust.Score~X,data,xlab="retained customers",ylab = "AI Trust Score")
abline(a=mean(AI.Trust.Score),b=0,col="green")
abline(a=o_zero,b=0,col='red')
#p-value = 0.124
#Multiple R-squared:  0.004509,	Adjusted R-squared:  0.00261 


#Q13 = how much was spent in the last 3 months.
o1<-lm(AI.Trust.Score~Q13,data)
summary(o1)
#p-value = 0.147 
#Multiple R-squared:  0.004003,	Adjusted R-squared:  0.002102 


o2<-lm(AI.Trust.Score~Q13+X,data)
summary(o2)

plot(AI.Trust.Score~Q13,xlab="amount spend in last 3 months",ylab = "AI Trust Score")
abline(a=mean(AI.Trust.Score),b=0,col="green")
abline(a=o1,b=0,col='red')


#forward building the model:
f1<-lm(AI.Trust.Score~Q13+factor(Q1),data)
summary(f1)
#Multiple R-squared:  0.01401,	Adjusted R-squared:  0.0006812
#f1 model is not a better model than o_zero,o1,o2

#Does our model explain our data better than the mean of our data? No,not really.
