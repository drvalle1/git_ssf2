plot(mod1$llk,type='l')
seq1=100:length(mod1$llk)
plot(mod1$llk[seq1],type='l')

par(mfrow=c(3,1),mar=c(1,4,1,1))
for (i in 1:3) {
  plot(mod1$betas[,i],type='l')
  abline(h=betas.true[i],col='red')
}

apply(mod1$betas,2,mean)
apply(mod1$betas,2,quantile,c(0.025,0.975))