print("Hello world")
x = c (3,4,6)
x
y = seq(from=4,length=4,by=2)
y
?seq
y = seq(length.out = 8)
y
y[2:4]
y[-8]
x[-1]
y[-c(3,4)]
# matrices
z=matrix(seq(1,12),4,3)
z
z[3:4,2:3]
z[,2:3]
z[,1,drop=FALSE]
dim(z)
ls()
rm(x)
ls()
m1 = matrix(data=c(1,2,3,4),nrow=2,ncol=2,byrow = TRUE)
print(m1)
print(sqrt(m1))

### generating random data and graphics
x = runif(50)
x
set.seed(8890)
y= rnorm(5)
y
mean(y)
var(y)
sd(y)

plot(x,y)
?par(mfrow=c(2,1))
plot(x,y)
hist(y)

### Reading data from files
df = read.csv("~/Documents/IITM/sem2/Data analytics and visualization (MA5755)/Rstudio/House_Price.csv")
names(df)
dim(df)
class(df)
summary(df)

## plotting the data
plot(df$resid_area,df$teachers)
attach(df)
plot(teachers,resid_area)
teachers=as.factor(teachers)

x = rnorm(100)
y = rnorm(100)
pdf("figure.pdf")
plot (x,y,xlab="Xnorm",ylab="Ynorm",main=" X vs Y",col="red")
dev.off()
print(seq(-pi,pi,length=10))

### contour plot
x = seq(-pi,pi,length=150)
y =x
f = outer(x,y,function(x,y) cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels = 45,add=T)
fa = (f-t(f))/2
contour(x,y,fa,nlevels=15)

## image function
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa, theta = 10)
persp(x,y,fa, theta = 10,phi = 20)
persp(x,y,fa, theta = 20,phi = 40)
persp(x,y,fa, theta = 30,phi = 70)
persp(x,y,fa, theta = 40,phi = 90)
persp(x,y,fa, theta = 50,phi = 110)
persp(x,y,fa, theta = 60,phi = 130)
persp(x,y,fa, theta = 70,phi = 150)
persp(x,y,fa, theta = 80,phi = 170)

