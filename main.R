
print(getwd())
source("pollutantmean.R")

pollutantmean("specdata", "sulfate", 1:10) #expected 4.064128
pollutantmean("specdata", "nitrate", 70:72) #expected 1.706047
pollutantmean("specdata", "nitrate", 23) #expected 1.280833


