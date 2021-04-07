rm(list=ls())
library('data.table')

#get covariates
setwd('U:\\GIT_models\\git_ssf\\fake data')
dat=fread('cumul_time and covs.csv')

#time model details
time.int=4
gamma.b=2

dat$time.prob=dgamma(time.int,gamma.b*dat$cum.time,gamma.b)

#get time.prob for selected pixels
cond=dat$selected==1
aux=dat[cond,c('mov.id','time.prob')]
colnames(aux)[2]='time.prob.sel'

#merge and subset
dat1=merge(dat,aux,all=T); dim(dat); dim(dat1)
cond=dat1$time.prob>(dat1$time.prob.sel*0.001)
dat2=dat1#[cond,]; dim(dat1); dim(dat2); mean(cond)

#export
setwd('U:\\GIT_models\\git_ssf\\fake data')
dat3=as.data.frame(dat2)
ind=which(colnames(dat3)%in%c('x','y','cum.time','time.prob.sel'))
write.csv(dat3[,-ind],'fake_data_trimmed.csv',row.names=F)