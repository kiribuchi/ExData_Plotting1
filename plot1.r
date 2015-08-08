# Check for and create directories
if(!file.exists("./data")) {
    dir.create("./data")
}

# Download a file from the web
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, 
              destfile = "./data/exdata-data-household_power_consumption.zip")
dateDownloaded <- date()
unzip("./data/exdata-data-household_power_consumption.zip", exdir = "./data")

# Load flat files
dataset <- read.csv2("./data/household_power_consumption.txt", 
                     stringsAsFactors = F)

# Use data from the dates 2007-02-01 and 2007-02-02
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ]
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create plot and send to a file
png("plot1.png", 480, 480)
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()