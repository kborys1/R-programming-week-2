library(tidyverse)
source("complete.R")

corr <- function(directory, threshold = 0)
{
  tbl <-
    list.files(path = paste("./",directory,"/", sep = ""),
               pattern = "*.csv", 
               full.names = T) %>%
    map_df(~read_csv(.))
  
  nGoodObs <- complete("specdata")
  nGoodObsAboveThreshold <- nGoodObs[nGoodObs$n > threshold,]
  
  output <- vector()
  for (i in nGoodObsAboveThreshold$ID)
  {
    station <- tbl[tbl$ID ==i,]
    c <- cor(station$nitrate, station$sulfate, use = "complete.obs")
    output <- c(output, c)
  }
  
  return(output)
}