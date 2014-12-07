data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   colClasses = c("character", "character", rep("numeric",7)))


subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480,height = 480, units = "px",bg = "#ffffff")
plot(subdata$DateTime, subdata$Global_active_power,  type="l",
     ylab="Global Active Power (kilowatts)", xlab="") 
dev.off()
