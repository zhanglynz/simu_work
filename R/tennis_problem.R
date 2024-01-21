# created date: 21 Jan 2023
# description: tennis problem
# reference: Chen Xiru's book, p. 16

A_wins_4 <- function(nbr_points = 4, diff_at_least = 2, p = 0.5, seed = 12345)
{set.seed(seed)
 sets_a_wins <- sets_b_wins <- 0   
 while(1) {
   rand_nbr <- rbinom(1, 1, prob = p)
   sets_a_wins <- sets_a_wins + rand_nbr
   sets_b_wins <- sets_b_wins + (1 - rand_nbr)
   the_diff <- sets_a_wins - sets_b_wins
   if(sets_a_wins >= nbr_points & the_diff >= diff_at_least) {
     the_re <- 1
     break
   }
   if(sets_b_wins >= nbr_points & the_diff <= -diff_at_least) {
     the_re <- 0
     break
   }
 }  
 return(the_re)  
}

N <- 1e6
(mean(vapply(1:N, A_wins_4, numeric(1), 
            nbr_points = 4, diff_at_least = 2, p = 0.75))) # 0.949112
my_func <- function(p = 0.75)
{r <- p / (1- p)
 a <- r^7 + 5 * r^6 + 11 * r^5 +15 * r^4
 b <- a + 15 * r^3 + 11 * r^2 + 5 * r + 1
 a/b
}
(my_func()) #  0.9492188
