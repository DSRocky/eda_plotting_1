rawData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?")
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date =="2007-02-02")
png("plot1.png", width=480, height=480)
hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()