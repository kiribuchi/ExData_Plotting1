# Load flat files
dataset <- read.csv2("./data/household_power_consumption.txt", 
                     stringsAsFactors = F)

# Use data from the dates 2007-02-01 and 2007-02-02
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$datetime <- strptime(paste(data$Date, data$Time), 
                          format = "%d/%m/%Y %H:%M:%S")

# Get weekdays in English
Sys.setlocale("LC_TIME","us")

# Create plot and send to a file
png("plot3.png", 480, 480)
with(data, plot(datetime, Sub_metering_1, type = "l", 
                xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()