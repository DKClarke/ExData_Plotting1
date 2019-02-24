test <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
test$Date <- as.character(test$Date)
test$Time <- as.character(test$Time)
testDates <- subset(test, subset = test[,1] == "1/2/2007")
testDatesOther <- subset(test, subset = test[,1] == "2/2/2007")
output <- rbind(testDates, testDatesOther)

output$DateTime <- paste(output$Date, output$Time, sep = "T")
output$DateTime <- as.POSIXct(output$DateTime, format = ("%d/%m/%YT%H:%M:%S"))
output$Global_active_power <- as.numeric(as.character(output$Global_active_power))

png(filename = "plot2.png", width = 480, height = 480)
plot(output$DateTime, output$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
