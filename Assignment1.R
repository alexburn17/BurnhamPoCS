###################################################################
# PoCS Assignment 1 code
# P. Alexander Burnham
# Sept 5, 2018
###################################################################

#Preliminaries:
# Clear memory of characters
ls()
rm(list=ls())


# set working Directory:
setwd("~/Documents/GitHub/BurnhamPoCS")

# Read in Data:
rowing <- read.csv("assignment1_rowing.csv", 
                header=TRUE, 
                sep = ",", 
                stringsAsFactors = FALSE)

# convert time into seconds
rowing$seconds <- as.numeric(strptime(rowing$Time, format="%M:%S") - as.POSIXct(format(Sys.Date())), units="secs")

# convert to meters per second
rowing$MperSec <- 2000/rowing$seconds

# plot speed by number of oarsman 
plot(rowing$Class, rowing$MperSec, xlab="Number of Oarsman", ylab="speed (m/s)")
abline(mod, col = "red")

# model fitting line to data set
mod <- lm(rowing$MperSec~rowing$Class)
summary(mod)
