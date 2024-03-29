# created date: 20 Jan 2024
# description: Problem of points
# reference: https://en.wikipedia.org/wiki/Problem_of_points
# https://probabilityandstats.wordpress.com/2016/11/06/the-problem-of-points/

set.seed(12345)

a_game <- function(s = 6, s_1 = 5, s_2 = 2)
{a_win_nbr <- s_1
 b_win_nbr <- s_2
 while(1) {
   rand_nbr <- rbinom(1, 1, 0.5)
   a_win_nbr <- a_win_nbr + rand_nbr
   b_win_nbr <- b_win_nbr + (1 - rand_nbr)
   if(b_win_nbr == s) {
     the_re <- 0
     break
   }
   if(a_win_nbr == s) {
     the_re <- 1
     break
   }
 }
 return(the_re)
} 
 
N <- 10000
 
(mean(vapply(1:N, function(i) a_game(s = 6, s_1 = 5, s_2 = 2), 
             FUN.VALUE = numeric(1))))
(15/16)

  
  
