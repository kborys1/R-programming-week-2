library(tidyverse)

pollutantmean <- function(directory, pollutant, id = 1:332)
{
print(paste("./",directory,"/"))
tbl <-
  list.files(path = paste("./",directory,"/", sep = ""),
             pattern = "*.csv", 
             full.names = T) %>%
  map_df(~read_csv(.))

selectedStations <- tbl[tbl$ID %in% id,]
mean(selectedStations[[pollutant]], na.rm = TRUE)
}
