data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   colClasses = c("character", "character", rep("numeric",7)))


subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png", width = 480,height = 480, units = "px",bg = "#ffffff")
hist(subdata$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     breaks = 12,
     ylim = c(0,1200))
dev.off()
