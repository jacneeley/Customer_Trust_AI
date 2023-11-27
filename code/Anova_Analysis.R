path <- "C:/Users/Owner/Documents/Python-Scripts/mkt_research/Phase2_mkt_research/ages.csv"
data<-read.table(file=path,sep=',',header=TRUE)

summary(data)

two_way <- aov(AI.Trust.Score ~ Age.Ranges+Income,data=data)
summary(two_way)

#               Df Sum Sq Mean Sq F value Pr(>F)  
#Age.Ranges     1     12   12.07   0.737 0.3908  
#Income         1     52   52.15   3.185 0.0746 .
#Residuals   1047  17143   16.37                 
#---
#  Signif. codes:  
#  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#p-values are greater than any reasonable alpha, fail to reject null hypothesis
#that there is no variance in means.