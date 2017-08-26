rawData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?")
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date =="2007-02-02")
datetime <- paste(as.Date(subData$Date), subData$Time)
png("plot3.png", width=480, height=480)
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)
with(subData, {
plot(Sub_metering_1~Datetime, type="l",
ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()