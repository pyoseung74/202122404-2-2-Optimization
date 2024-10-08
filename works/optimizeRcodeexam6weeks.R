install.packages("lpSolve") 
library(lpSolve)

obj <- c(1.5,1) # I목적함수 계수벡터c
cons <- matrix(c(1,0,0,1,1,1),byrow = T, ncol=2) # 제약식 계수행렬 A

dir <- rep("<=",3) # 제약식 부등호 벡터
rhs <- c(4,6,5) # 제약식 우변상수 벡터 b

LP1 <- lp("max",obj, cons, dir, rhs) # lpsolve 사용법
LP1$objval   # 목적함수 값
LP1$solution # 최적해

quiz <- read.csv("quiz.csv", header = T)
quiz <- as.matrix(quiz)

obj <- quiz[1,]
cons <- quiz[-1,]
dir <- c(rep(">=",5),"==")
rhs <- c(rep(0,5),1)
lp("max",obj, cons, dir, rhs)

obj <- c(0.4,0.6)
cons <-matrix(c(5,10,
                1,1,
                0,1),byrow= T, ncol = 2)

dir <- c("<=","<=",">=")
rhs <- c(38,5,1)
lp("max")

# 과제

