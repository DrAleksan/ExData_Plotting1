file_name = "household_power_consumption.txt"
if(!file.exists(file_name)){
    link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(link, "pc.zip")
    unzip("pc.zip")
}

png("plot4.png")
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = "character")
data <- mutate(data, full_time = paste(Date, Time))
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$full_time <- strptime(data$full_time, format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))
with(data, {
    plot(full_time, Global_active_power, type = "l", 
         xlab = "", ylab = "Global active Power (kilowatts)")
    plot(full_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(full_time, Sub_metering_1, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    points(full_time, Sub_metering_2, type = "l", col = "red")
    points(full_time, Sub_metering_3, type = "l", col = "blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = c(1, 1, 1), 
           bty = "n")
    plot(full_time, Global_reactive_power, type = "l",
         xlab = "datetime")
})
dev.off()