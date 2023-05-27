# Load required libraries
install.packages("ggplot2")
library(ggplot2)
# Read the data for the specified dates (2007-02-01 and 2007-02-02)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")


# Convert the Date and Time variables to appropriate classes
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the data for the specified date range
subset_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Create the plot using ggplot2
ggplot(subset_data, aes(x = DateTime, y = Global_active_power)) +
  geom_line() +
  labs(x = NULL, y = "Global Active Power") +
  ggsave("plot1.png", width = 480, height = 480, dpi = 96, limitsize = FALSE)