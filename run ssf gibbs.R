rm(list=ls())
set.seed(10)
library('data.table')
library('Rcpp')

setwd('U:\\GIT_models\\git_ssf')
sourceCpp('aux1.cpp')
source('ssf gibbs main function.R')
source('ssf gibbs functions.R')

setwd('U:\\GIT_models\\git_ssf\\fake data')
dat=as.data.frame(fread('fake_data_trimmed.csv'))

nomes=paste0('cov',1:3)
xmat=data.matrix(dat[,nomes])

#parameters for gibbs sampler
ngibbs=1000
nburn=ngibbs/2

mod1=ssf_gibbs(dat=dat,ngibbs=ngibbs,nburn=nburn,xmat=xmat)
