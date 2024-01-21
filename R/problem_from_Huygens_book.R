# created date: 21 Jan 2024
# description: a problem from Huygens' book
# reference: Chen Xiru's book, pp. 11-12

A_wins <- function(seed = 12345)
{set.seed(seed)
 rand_nbr <- ceiling(6 * runif(1))
 if(rand_nbr == 6) return(1L)
 while(1) {
    B_rand_nbr <- sum(ceiling(6 * runif(2)))
    if(B_rand_nbr == 7) {
      the_re <- 0L
      break
    }
    A_rand_nbr <- sum(ceiling(6 * runif(2)))
    if(A_rand_nbr == 6) {
      the_re <- 1L
      break
    }
 }
 return(the_re)
}

N <- 1e6
mean(vapply(1:N, A_wins, numeric(1))) # 0.508656
# (10355/22631)?

q_a <- 31/36
q_b <- 5/6
p_a <- 5/36
(1 - q_a * q_b + 5 * q_b * p_a) / (6 * (1 - q_a * q_b)) #  0.5081967
