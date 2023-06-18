# Load required packages
library(dplyr)

# Load the dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date and Time variables to proper format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the data for the specified dates
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01"), ]
subset_data <- subset_data[subset_data$DateTime < as.POSIXct("2007-02-03"), ]

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", main = "Energy Sub Metering 1 vs. Time")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()