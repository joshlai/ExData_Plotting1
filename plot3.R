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

# Print Plot3 into PNG file
par(mfrow=c(1,1))
with(data, 
    {plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="", col="Black")
     lines(Sub_metering_2~DateTime,col="Red")
     lines(Sub_metering_3~DateTime,col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=540)
dev.off()