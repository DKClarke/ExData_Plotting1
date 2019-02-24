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

png(filename = "plot3.png", width = 480, height = 480)
plot(output$DateTime, output$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(output$DateTime, output$Sub_metering_2, type = "l", col = "red")
points(output$DateTime, output$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)
dev.off()


