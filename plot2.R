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

# Create Plot2
png("plot2.png", width = 480, height = 480, units = "px")
plot(myData$DateTime, myData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()

