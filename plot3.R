## Data Science Specialization - Exploratory Data Analysis
## WEEK 1 - PROGRAMMING ASSIGNMENT - Plot 3
## Author: Justyna Pawlata
## Date: Jan 07, 20178

# Creating directory for new data files
if(!file.exists("data")){
    dir.create("data")
}

# Download data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/household_power_consumption.zip", mode = "wb")
unzip("./data/household_power_consumption.zip", exdir = "./data/")
myData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")

# Convert date and time
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y") 

# Data from the dates 2007-02-01 and 2007-02-02 only
myDates <- subset(myData, (myData$Date >= "2007-02-01" & myData$Date  <= "2007-02-02"))

# Add new column with date&time
myDates$Calendar <- as.POSIXct(paste(myDates$Date, myDates$Time))

# Convert factor into numeric values
myDates$Sub_metering_1 <- as.numeric(levels(myDates$Sub_metering_1))[myDates$Sub_metering_1]
myDates$Sub_metering_2 <- as.numeric(levels(myDates$Sub_metering_2))[myDates$Sub_metering_2]

# Create plot3
plot(myDates$Calendar, myDates$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(myDates$Calendar, myDates$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = " ")
lines(myDates$Calendar, myDates$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = " ")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lwd = 1)

# Create png file
dev.copy(png, file = "./plot3.png", width = 480, height = 480)
dev.off()
