rawData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?")
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date =="2007-02-02")
datetime <- paste(as.Date(subData$Date), subData$Time)
png("plot2.png", width=480, height=480)
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)
plot(subData$Global_active_power ~ subData$Datetime, ylab="Global Active Power (kilowatts)", type="l", xlab="")
dev.off()