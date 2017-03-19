data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- rbind(data[data$Date == "1/2/2007", ], data[data$Date == "2/2/2007", ])
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data$Global_active_power)

png("plot1.png")

hist(GlobalActivePower, col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

dev.off()

