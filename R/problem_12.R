# created date: 4 Feb 2024
# description: problem 12 in Nahin's book (p. 34)

set.seed(12345)

an_exp <- function()
{rand_nbr <- runif(2, min = -1, max = 1)
 rand_nbr <- rand_nbr^2 # a trick --- see Nahin's book (p. 35)
 chk <- ((rand_nbr[1]^(1/3) + rand_nbr[2]^(1/3)) < 1) + 0.0
 return(chk)
}

N <- 1e6
exp_re <- replicate(N, an_exp())

(mean(exp_re)) #  0.294705; truth 0.2945, see Nahin's book (p. 212)
esti <- cumsum(exp_re) / (1:N)
plot(x = 1:N, y = esti, type = 'l')
abline(a = 0.2945, b = 0, lty = 2, lwd = 2, col = 'red')
