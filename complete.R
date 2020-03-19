library(tidyverse)
library(dplyr)


complete <- function(directory, id = 1:332)
{
  # read hundreds of csv files
  tbl <-
    list.files(
      path = paste("./", directory, "/", sep = ""),
      pattern = "*.csv",
      full.names = T
    ) %>%
    map_df( ~ read_csv(.))
  
  
  # count number of good observations for stations in id
  # good observation = nitrate<>NA and sulfate<>NA
  good2 <- complete.cases(tbl)
  
  nGoodObservations <- tally(group_by(tbl[good2, ], ID))
  nGoodObservations[nGoodObservations$ID %in% id, ]
  
}