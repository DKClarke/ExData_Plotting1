test <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
test$Date <- as.character(test$Date)
test$Time <- as.character(test$Time)
testDates <- subset(test, subset = test[,1] == "1/2/2007")
testDatesOther <- subset(test, subset = test[,1] == "2/2/2007")
output <- rbind(testDates, testDatesOther)

output$DateTime <- paste(output$Date, output$Time, sep = "T")
output$DateTime <- as.POSIXct(output$DateTime, format = ("%d/%m/%YT%H:%M:%S"))
output$Global_active_power <- as.numeric(as.character(output$Global_active_power))

output$Sub_metering_1 <- as.numeric(as.character(output$Sub_metering_1))
output$Sub_metering_2 <- as.numeric(as.character(output$Sub_metering_2))
output$Sub_metering_3 <- as.numeric(as.character(output$Sub_metering_3))

output$Voltage <- as.numeric(as.character(output$Voltage))
output$Global_reactive_power <- as.numeric(as.character(output$Global_reactive_power))

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))
plot(output$DateTime, output$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(output$DateTime, output$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(output$DateTime, output$Sub_metering_2, type = "l", col = "red")
points(output$DateTime, output$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(output$DateTime, output$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(output$DateTime, output$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
