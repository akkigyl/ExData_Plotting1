cls <- c(Voltage="numeric", Global_active_power="numeric",
         Global_intensity="numeric",Sub_metering_1="numeric",
         Sub_metering_2="numeric",Sub_metering_3="numeric",
         Global_active_power="numeric",Global_reactive_power="numeric")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", stringsAsFactors = FALSE, na.strings = "?",
                   colClasses = cls)

energyData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
energyData <-na.omit(energyData)
datetime <- strptime(paste(energyData$Date, energyData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(datetime, energyData$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, energyData$Sub_metering_2, type="l", col="red")
lines(datetime, energyData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
