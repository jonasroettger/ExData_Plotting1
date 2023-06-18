# Load required packages
library(dplyr)

# Load the dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date and Time variables to proper format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the data for the specified dates
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01"), ]
subset_data <- subset_data[subset_data$DateTime < as.POSIXct("2007-02-03"), ]

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", main = "Global Active Power")
plot(subset_data$DateTime, subset_data$Voltage, type = "l", xlab = "DateTime", ylab = "Voltage", main = "Voltage")
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", xlab = "DateTime", ylab = "Energy Sub Metering 1", main = "Energy Sub Metering 1")
plot(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", xlab = "DateTime", ylab = "Energy Sub Metering 2", main = "Energy Sub Metering 2")
dev.off()