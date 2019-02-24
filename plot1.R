test <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
test$Date <- as.character(test$Date)
testDates <- subset(test, subset = test[,1] == "1/2/2007")
testDatesOther <- subset(test, subset = test[,1] == "2/2/2007")
output <- rbind(testDates, testDatesOther)

output$Global_active_power <- as.numeric(as.character(output$Global_active_power))
png(filename = "plot1.png", width = 480, height = 480)
hist(output$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
