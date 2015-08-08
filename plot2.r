# Load flat files
dataset <- read.csv2("./data/household_power_consumption.txt", 
                     stringsAsFactors = F)

# Use data from the dates 2007-02-01 and 2007-02-02
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$datetime <- strptime(paste(data$Date, data$Time), 
                          format = "%d/%m/%Y %H:%M:%S")

# Get weekdays in English
Sys.setlocale("LC_TIME","us")

# Create plot and send to a file
png("plot2.png", 480, 480)
with(data, plot(datetime, Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()