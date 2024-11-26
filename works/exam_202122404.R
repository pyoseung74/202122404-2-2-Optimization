P <- diag(c(2,2,2,4),4)
P
A <- matrix(c(1,1,1,1,
              1,2,1,-4,
              -1,0,0,5), byrow = T, ncol = 4)
A
q <- rep(0,4)
b <- c(8,2,9)

K
K <- matrix(0, ncol = 7, nrow = 7)
K[1:4,1:4] <- P

K[5:7,1:4] <- A
K[1:4,5:7] <- t(A)

solve(K) %*% c(-q,b)

install.packages("nloptr")
library(nloptr)
eval_f <- function(x)
  list(
    "objective" = x[1]^2 + x[2]^2 + x[3]^2 + 2*x[4]^2,
    "gradient" = c(2*x[1],2*x[2],2*x[3],4*x[4])
  )  

# equality constraints
eval_q_eq <- function(x)
  list(
    "constraints" = c(x[1]+x[2]+x[3]+x[4]-8,
                      x[1]+2*x[2]+x[3]-4*x[4]-2,
                      -x[1]+5*x[4]-9),
    "jacobian" = rbind(c(1,1,1,1),
                       c(1,2,1,-4),
                       c(-1,0,0,5))
  )

x_init <- c(0,0,0,0)

optimizer <- list("algorithm" = "NLOPT_LD_LBFGS",
                  "xtol_rel" = 1.0e-30)

options <- list("algorithm" = "NLOPT_LD_LBFGS",
                "xtol_rel" = 1.0e-30,
                "maxeval" = 1000,
                "local_opts" = optimizer)
nlp4 <- nloptr(x0= x_init,
               eval_f = eval_f,
               eval_g_eq= eval_q_eq,
               opts = options)

nlp4$objective
nlp4$solution
