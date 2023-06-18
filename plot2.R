# Load required packages
library(dplyr)

# Load the dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date and Time variables to proper format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the data for the specified dates
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01"), ]
subset_data <- subset_data[subset_data$DateTime < as.POSIXct("2007-02-03"), ]

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "Global Active Power vs. Time")
dev.off()
