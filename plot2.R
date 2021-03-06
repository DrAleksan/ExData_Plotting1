file_name = "household_power_consumption.txt"
if(!file.exists(file_name)){
    link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(link, "pc.zip")
    unzip("pc.zip")
}

png("plot2.png")
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = "character")
data <- mutate(data, full_time = paste(Date, Time))
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$full_time <- strptime(data$full_time, format = "%d/%m/%Y %H:%M:%S")
with(data, plot(full_time, Global_active_power, type = "l", xlab = "", ylab = "Global active Power (kilowatts)"))
dev.off()
