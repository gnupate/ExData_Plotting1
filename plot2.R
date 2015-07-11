library(dplyr) ## use the dplyr library

## read in the data then filter out just the Feb 1 and 2 data from 2007
airqual <- read.csv("household_power_consumption.txt", sep=";")
aq <- filter(airqual, Date == "1/2/2007" | Date == "2/2/2007")
aq <- mutate(aq, datetime = paste(as.character(Date), as.character(Time), sep=" "))

## use the png filter to write to a graphics file device
png(file="plot2.png")

plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
