library(survival)
library(ggplot2)
library(survminer)

company = c("A","A","A","A","A","B","B","B","B","B")
phone = c("A1","A2","A3","A4","A5","B1","B2","B3","B4","B5")
t = c(1.1,2.2,3.3,4,4,1,1.5,3.5,4,4)
eve = c(1,1,1,0,0,0,1,1,0,0)
Surv(t,eve)

sobj = data.frame(company,phone,t,eve)

# survfit object builds
km = survfit(Surv(t,eve)~company,data=sobj)
plot(km,xlab="Years",ylab="Estimated survival probability")


fit.surv = survfit(Surv(t,eve)~company,data = sobj)
plot(fit.surv,xlab= "Years",ylab=" Estimate Probability of Survival ",col = c(2,4))
ggsurvplot(fit.surv,xlab="Years","ylab=Estimated Survival Probability")

fit.surv = surv_fit(Surv(t,eve)~company,data=sobj)
median = surv_median(fit.surv)
median$median[2]

# B has more survival median than A

#sobj_new = rbind(sobj,c("C","C1",1,0),c("C","C2",1.5,1),c("C","C3",3.5,1),c("C","C4",2,0),c("C","C5",5,0))
#sobj_new = na.omit(sobj_new)

#fit.surv1 = surv_fit(Surv(t,eve)~company,data=sobj_new)
#median = surv_median(fit.surv1)


company = c("A","A","A","A","A","C","C","C","C","C")
phone = c("A1","A2","A3","A4","A5","C1","C2","C3","C4","C5")
t = c(1.1,2.2,3.3,4,4,1,1.5,3.5,2,5)
eve = c(1,1,1,0,0,0,1,1,0,0)

sobj_new = data.frame(company,phone,t,eve)
fit.surv = surv_fit(Surv(t,eve)~company,data = sobj_new)
median = surv_median(fit.surv)
