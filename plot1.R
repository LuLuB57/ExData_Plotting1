## Download the Power Consumption dataset and set your working directory
## Read the Power dataset
data_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

## Subset the data
power <- subset(data_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_power)

## Converting dates
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()