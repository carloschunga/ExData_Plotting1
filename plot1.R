#Hi! To make the data manipulation process easier I use some packages from the famous tidyverse. Specifically,
#I use lubridate, dplyr, and another package called "hms" to convert the second column to a time format.
#If you want to install these packages, you're going to need to run "install.packages("tidyverse")",
#"install.packages("lubridate")", and "install.packages("hms")".


#Part 1 - Load the packages:

library(tidyverse)
library(lubridate)
library(hms)

#Part 2 - Read the Individual household electric power consumption Data Set.

#For that purpose, I preestablish each column with its atomic vector type, except for the first and second columns,
#which I will handle in just a moment:

household <- read.csv(
  "household_power_consumption.txt",
  sep = ";",
  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
  na.strings = "?"
  )

#Part 3 - Convert the 1st and 2nd columns to appropriate types.

#Here I use dmy from the "lubridate" package to convert the first column to a data class, and then as_hms from the 
#"hms" package to convert the second column to a time format:

household$Date <- dmy(household$Date)
household$Time <- as_hms(household$Time)

#Part 4 - Filtering those observations corresponding to 2017-02-01 and 2017-02-02.

#For that purpose, I use dplyr and its function "filter" alongside lubridate::year, lubridate::month, and lubridate::day:

household <- household %>% 
  dplyr::filter(year(Date) == 2007, month(Date) == 2, day(Date) %in% c(1,2))

#Part 5 - The First Plot of this assignment with what we have learned so far.

#Here I tweak the code to output the plot in a PNG file as the graphics device instead of the screen device:

png("plot1.png", width = 480, height = 480)

with(household, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()