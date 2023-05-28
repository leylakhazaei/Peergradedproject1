# Load required packages
library(ggplot2)

# Read the data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert Date and Time to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for the required dates
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]


# Plot 4: Voltage and Global Reactive Power
png("plot4.png", width = 960, height = 480)

# Divide the plotting area into a 2x2 grid
par(mfrow = c(2, 2))

# Plot 1: Voltage
plot(subset_data$DateTime, subset_data$Voltage, type = "l", xlab = "DateTime", ylab = "Voltage (volt)", main = "Voltage")

# Plot 2: Global Reactive Power
plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global Reactive Power (kilowatts)", main = "Global Reactive Power")

# Plot 3: Global Active Power
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "DateTime", ylab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Plot 4: Energy Sub-Metering
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", xlab = "DateTime", ylab = "Energy Sub-Metering (watt-hour)", main = "Energy Sub-Metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()

