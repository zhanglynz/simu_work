# created date: 28 Jan 2024
# description: at-least-one-match problem
# reference: "Will you be alive 10 years from now?" p xvi 


set.seed(12345)
N <- 10000

an_exp <- function(n)
{x <- sample(1:n)
 diff <- x - (1:n)
 the_re <- ifelse(0 %in% diff, 1, 0)
 the_re
}

system.time(
{print(mean(vapply(1:N, function(i) an_exp(n = 1e6), numeric(1))))}
) # 0.6278
# [1] 0.6278
# user  system elapsed 
# 1250.45  105.91 1629.90 
# answer in the book: 0.632