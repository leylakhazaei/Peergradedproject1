# Load required packages
library(ggplot2)

# Read the data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert Date and Time to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for the required dates
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]


# Plot 2: Global Active Power over Time
png("plot2.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "DateTime", ylab = "Global Active Power (kilowatts)", main = "Global Active Power Over Time")
dev.off()
