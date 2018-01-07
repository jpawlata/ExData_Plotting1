## Data Science Specialization - Exploratory Data Analysis
## WEEK 1 - PROGRAMMING ASSIGNMENT - Plot 2
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
myDates$Global_active_power <- as.numeric(levels(myDates$Global_active_power))[myDates$Global_active_power]

# Create plot2
with(myDates, plot(Calendar, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Create png file
dev.copy(png, file = "./plot2.png", width = 480, height = 480)
dev.off()
