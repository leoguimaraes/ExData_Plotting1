a <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

a$date_time <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a$Date <- as.Date(a$Date, "%d/%m/%Y")

b <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(b$date_time, b$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()