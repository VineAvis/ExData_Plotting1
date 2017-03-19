data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- rbind(data[data$Date == "1/2/2007", ], data[data$Date == "2/2/2007", ])
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(data$Global_active_power)
SubMetering1 <- as.numeric(data$Sub_metering_1)
SubMetering2 <- as.numeric(data$Sub_metering_2)
SubMetering3 <- as.numeric(data$Sub_metering_3)
Voltage <- as.numeric(data$Voltage)
GlobalReactivePower <- as.numeric(data$Global_reactive_power)

png("plot4.png")
par(mfrow = c(2,2))

plot(DateTime, GlobalActivePower, ylab = "Global Active Power", type = "l")
plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(DateTime, SubMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, SubMetering2, col = "red", type = "l")
lines(DateTime, SubMetering3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black","red","blue"))
plot(DateTime, GlobalReactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()