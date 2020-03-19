library(tidyverse)

pollutantmean <- function(directory, pollutant, id = 1:332)
{
  # read hundreds of csv files
  print(paste("./", directory, "/"))
  tbl <-
    list.files(
      path = paste("./", directory, "/", sep = ""),
      pattern = "*.csv",
      full.names = T
    ) %>%
    map_df( ~ read_csv(.))
  
  # compute mean(pollutant) for stations in id
  selectedStations <- tbl[tbl$ID %in% id, ]
  mean(selectedStations[[pollutant]], na.rm = TRUE)
}
