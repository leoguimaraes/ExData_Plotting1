a <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

a$date_time <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a$Date <- as.Date(a$Date, "%d/%m/%Y")

b <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(b$date_time, b$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(b$date_time, b$Sub_metering_2, type = "l", col = "red")
points(b$date_time, b$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =c("black", "red", "blue"), lty=1, lwd=2.5)
dev.off()