setwd("~/Tareas universidad/4 Semestre/Matematica Discreta/Hoja de Trabajo #3")

#install.packages("gmp")
library(gmp)
factorize(270270)
factorize(81114783750)
factorize(11310490941750)
factorize(4199506113235180000)
factorize(113)

###Solo numeros pequeños######
findfactors <- function(num) {
  x <- c()
  primero <- 2; segundo <- 3; everyprime <- num
  while( everyprime != 1 ) {
    if ( everyprime%% primero == 0 ) {
      x <- c(x, primero)
      everyprime <- floor(everyprime/ primero)
    }
    primero <- segundo
    segundo <- segundo + 2
  }
  x
}

print(findfactors(4199506113235180000))


#####OTRA#####

library(gmp)
library(plyr)

get_all_factors <- function(n)
{
  prime_factor_tables <- lapply(
    setNames(n, n), 
    function(i)
    {
      if(i == 1) return(data.frame(x = 1L, freq = 1L))
      plyr::count(as.integer(gmp::factorize(i)))
    }
  )
  lapply(
    prime_factor_tables, 
    function(pft)
    {
      powers <- plyr::alply(pft, 1, function(row) row$x ^ seq.int(0L, row$freq))
      power_grid <- do.call(expand.grid, powers)
      sort(unique(apply(power_grid, 1, prod)))
    }
  )
}

get_all_factors(30030)



