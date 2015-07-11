library(dplyr) ## use the dplyr library

## NOTE:  I have not saved the data to github, it should be unzipped into the directrory where this script is run

## read in the data then filter out just the Feb 1 and 2 data from 2007
airqual <- read.csv("household_power_consumption.txt", sep=";")
aq <- filter(airqual, Date == "1/2/2007" | Date == "2/2/2007")
aq <- mutate(aq, datetime = paste(as.character(Date), as.character(Time), sep=" "))

## use the png filter to write to a graphics file device
png(file="plot3.png")

plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_1)), 
         type="n", xlab="", ylab="Energy sub metering")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_1)), 
       type="l")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_2)), 
         type="l", col="red")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_3)), 
       type="l", col="blue")

legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
