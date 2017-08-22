### if(file.exist)...

png("plot1.png")
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = "character")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()