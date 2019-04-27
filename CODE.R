library(readxl)
library(MASS)
library(xlsx)
setwd("C:/Users/Kevin/Desktop/FOCUS/Fall Sem '18/609/Assignment/1. NFL ranking using Markov chain")
nfldata <- read_excel("nfldata.xlsx")
View(nfldata)
mat<- as.data.frame(nfldata)
summary(mat)
#-----------------------------------------------------#
## TYPE 1: Matrix by assigning W/L scores individually 
#Transition Matrix
P1=matrix(data = 0, nrow = 32, ncol = 32)
for (i in 1:256) {
  k=mat$Winner[i]
  for (j in 1:256) {
    l=mat$Loser[j]
    if(i==j){
      P1[k,l]=mat$PL[i]
      P1[l,k]=mat$PW[i]
    }
  }
}
Pfinal_1 <- P1 
write.xlsx(Pfinal_1, "TransitionMat1.xlsx")

#Stochastic Matrix using Normalization of rows
for(i in 1:32){
  for (j in 1:32) {
    Pfinal_1[i,j] = P1[i,j]/sum(P1[i,1:32])
  }
}
write.xlsx(Pfinal_1, "NormalizedMat1.xlsx")
#Steady State Matrix
r=eigen(Pfinal_1)
rvec=r$vectors
# left eigenvectors are the inverse of the right eigenvectors
lvec=ginv(r$vectors)
# The eigenvalues
lam<-r$values
# Two ways of checking the spectral decomposition:
# Standard definition
rvec%*%diag(lam)%*%ginv(rvec)
Pinf_1 <- Re(lvec[1,]/sum(lvec[1,]))
Pinf_1
write.xlsx(Pinf_1, "Ranking1.xlsx")

#-----------------------------------------------------#
## TYPE 2: Random Walk Method
#Transition Matrix
P2=matrix(data = 0, nrow = 32, ncol = 32)
for (i in 1:256) {
  k=mat$Winner[i]
  for (j in 1:256) {
    l=mat$Loser[j]
    if(i==j){
      P2[l,k]=1
    }
  }
}
Pfinal_2 <- P2
for(i in 1:32){
if(sum(Pfinal_2[i,])==0){
  Pfinal_2[i,]=1/32
   }
}
write.xlsx(Pfinal_2, "TransitionMat2.xlsx")
#Stochastic Matrix
for(i in 1:32){
  for (j in 1:32) {
    Pfinal_2[i,j] = Pfinal_2[i,j]/sum(Pfinal_2[i,1:32])
  }
}
write.xlsx(Pfinal_2, "NormalizedMat2.xlsx")
#Steady State Matrix
r=eigen(Pfinal_2)
rvec=r$vectors
lvec=ginv(r$vectors)
lam<-r$values
rvec%*%diag(lam)%*%ginv(rvec)
Pinf_2<-Re(lvec[1,]/sum(lvec[1,]))
Pinf_2
write.xlsx(Pinf_2, "Ranking2.xlsx")
#-----------------------------------------------------#
## TYPE 3: Difference of W/L points method
#Transition Matrix
P3 <- matrix(data = 0, nrow = 32, ncol = 32)
for (i in 1:256) {
  k=mat$Winner[i]
  for (j in 1:256) {
    l=mat$Loser[j]
    if(i==j){
      P3[l,k]=0.85*mat$diff[i]
    }
  }
}
S <- matrix(data=0.15, nrow=32, ncol=32)
Pfinal3 <- P3+S
#Stochastic Matrix
for(i in 1:32){
  for (j in 1:32) {
    Pfinal3[i,j] = Pfinal3[i,j]/sum(Pfinal3[i,1:32])
  }
}
write.xlsx(Pfinal3, "NormalizedMat3.xlsx")
#Steady State Matrix
r=eigen(Pfinal3)
rvec=r$vectors
lvec=ginv(r$vectors)
lam<-r$values
rvec%*%diag(lam)%*%ginv(rvec)
Pinf_3<-Re(lvec[1,]/sum(lvec[1,]))
Pinf_3
write.xlsx(Pinf_3, "Ranking3.xlsx")
####################################################################################################################