library(dplyr) ## use the dplyr library
## NOTE:  I have not saved the data to github, it should be unzipped into the directrory where this script is run

## read in the data then filter out just the Feb 1 and 2 data from 2007
airqual <- read.csv("household_power_consumption.txt", sep=";")
aq <- filter(airqual, Date == "1/2/2007" | Date == "2/2/2007")

## use the png filter to write to a graphics file device
png(file="plot1.png")
hist(as.numeric(as.character(aq$Global_active_power)), 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
dev.off()