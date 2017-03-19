data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- rbind(data[data$Date == "1/2/2007", ], data[data$Date == "2/2/2007", ])
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

SubMetering1 <- as.numeric(data$Sub_metering_1)
SubMetering2 <- as.numeric(data$Sub_metering_2)
SubMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(DateTime, SubMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, SubMetering2, col = "red", type = "l")
lines(DateTime, SubMetering3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black","red","blue"))
dev.off()