library(dplyr) ## use the dplyr library

## read in the data then filter out just the Feb 1 and 2 data from 2007
airqual <- read.csv("household_power_consumption.txt", sep=";")
aq <- filter(airqual, Date == "1/2/2007" | Date == "2/2/2007")
aq <- mutate(aq, datetime = paste(as.character(Date), as.character(Time), sep=" "))

## use the png filter to write to a graphics file device
png(file="plot4.png")

par(mfcol=c(2,2))

# upper left
plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Global_active_power)), 
     type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")


#lower left 
plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_1)), 
         type="n", xlab="", ylab="Energy sub metering")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_1)), 
        type="l")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_2)), 
        type="l", col="red")

points(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Sub_metering_3)), 
        type="l", col="blue")

legend("topright", bty="n", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# upper right
plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Voltage)), 
     type="l", 
     xlab="datetime", ylab="Voltage")

# lower left
plot(strptime(aq$datetime, "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(aq$Global_reactive_power)), 
     type="l", 
     xlab="datetime", ylab="Global_reactive_power")


dev.off()
