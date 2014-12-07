# Getting full dataset. Make '?' as N.A.
fullData <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Format Date, so that the Date can be sorted and re-arranged
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

# Only select the data between 2007-02-01 and 2007-02-02
data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the full dataset
rm(fullData)

# Combine date and time together for ploting purposes
dateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(dateTime)

# Print Plot2 into PNG file
par(mfrow=c(1,1))
plot(data$Global_active_power~data$DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()