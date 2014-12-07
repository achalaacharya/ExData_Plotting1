data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   colClasses = c("character", "character", rep("numeric",7)))


subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480,height = 480, units = "px",bg = "#ffffff")
with(subdata, {
  plot(DateTime,Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(DateTime,Sub_metering_2,col='Red')
  lines(DateTime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
