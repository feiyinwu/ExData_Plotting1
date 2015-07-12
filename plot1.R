# Load data
myFile <- read.table("household_power_consumption.txt", sep = ";", 
                     colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     na.strings = "?", header = TRUE)

# Subset data
library(dplyr)
myData1 <- filter(myFile, Date == "1/2/2007")
myData2 <- filter(myFile, Date == "2/2/2007")
myData <- rbind(myData1,myData2)

# Create Plot1
png("plot1.png", width = 480, height = 480, units = "px")
hist(myData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()