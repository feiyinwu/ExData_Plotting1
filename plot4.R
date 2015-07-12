# Load data
myFile <- read.table("household_power_consumption.txt", sep = ";", 
                     colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     na.strings = "?", header = TRUE)

# Subset data
library(dplyr)
myData1 <- filter(myFile, Date == "1/2/2007")
myData2 <- filter(myFile, Date == "2/2/2007")
myData <- rbind(myData1,myData2)
myData$DateTime <- strptime(paste(myData$Date, " ", myData$Time),format = "%Y-%m-%d %H:%M:%S")

# Create Plot4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# Subplot 1
plot(myData$DateTime, myData$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab ="")

# Subplot 2
plot(myData$DateTime, myData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Subplot 3
plot(c(myData$DateTime,myData$DateTime,myData$DateTime), 
     c(myData$Sub_metering_1, myData$Sub_metering_2, myData$Sub_metering_3), 
     type = "n", ylab = "Energy sub metering", xlab="")
lines(myData$DateTime, myData$Sub_metering_1, col="black")
lines(myData$DateTime, myData$Sub_metering_2, col="red")
lines(myData$DateTime, myData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

# Subplot 4
plot(myData$DateTime, myData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()