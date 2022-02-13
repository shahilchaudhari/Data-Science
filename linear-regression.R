library(MASS)
library(ISLR)
names(Boston)
?Boston

# simple linear regression

plot.window()
par(plot(medv~lstat,Boston,asp=0.5))
  ?par

fit1 = lm(medv~lstat,data=Boston)
fit1
summary(fit1)
abline(fit1,col="blue")
names(fit1)
confint(fit1)
predict(fit1,data.frame(lstat=c(5,10,15)),interval = 'confidence')

# multiple linear regression

fit2 = lm(medv~lstat+age,data=Boston)
summary(fit2)
fit3 = lm(medv~.,data=Boston)
summary(fit3)

par(mfrow=c(2,2))
plot(fit3)
fit4 = update(fit3,~.-age-indus)
summary(fit4)

# non linear terms and Interaction
fit5 = lm(medv~lstat*age,Boston)
summary(fit5)
fit6 = lm(medv~lstat+I(lstat^2),Boston); summary(fit6)
attach(Boston)
par(mfrow=c(1,1))
plot(medv~lstat)
points(lstat,fitted(fit6),col='red',pch=20)

# fitting polynomial of degree 4
fit7 = lm(medv~poly(lstat,4))
points(lstat,fitted(fit7),col='blue',pch=20)

# plotting characters
plot(1:20,1:20,pch=1:20,cex=2)


# Qualitative Predictors
fix(Carseats)
names(Carseats)
summary(Carseats)
fit8 = lm(Sales~.+Income:Advertising+Age:Price,Carseats)
summary(fit8)
contrasts(Carseats$ShelveLoc)

# writting R functions
regplot = function(x,y){
  fit = lm(y~x)
  plot(x,y)
  abline(fit,col = 'red')
}
attach(Carseats)
regplot(Price,Sales)

regplot = function(x,y,...){
  fit = lm(y~x)
  plot(x,y,...)
  abline(fit,col = 'red')
}

regplot(Price,Sales,xlab="Price",ylab="Sales",col="blue",pch=20)

