# created date: 4 Feb 2024
# description: problem 11 in Paul J. Nahin's book; p. 34

set.seed(12345)

an_exp <- function()
{k <- 0
 while(1) {
   k <- k + 1
   toss <- pmax(1L, ceiling(6 * runif(k)))
   if(6L %in% toss) {
     a_wins <- 1L
     break
   } else {
     toss <- pmax(1L, ceiling(6 * runif(k)))
     if(6L %in% toss) {
       a_wins <- 0L
       break
     }
   }
 }
 return(a_wins)
}

N <- 1e6

exp_re <- replicate(N, an_exp())
(mean(exp_re)) # 0.596957; truth: 0.596794 Nahin's book; p. 209

esti <- cumsum(exp_re) / (1:N)
plot(x = 1:N, y = esti, type = 'l')
abline(b = 0, a = 0.596794, lty = 2, lwd = 2, col = 'red')