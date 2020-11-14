# Setting working folder #
tPath <- "D:/00-OneDrive/GitHub/ExData_Plotting1"
setwd(tPath)
# Read in the data #
fnm <- "household_power_consumption.txt"
D <- read.table(fnm, header = TRUE, sep = ";", na.strings = "?")
# filter the data #
DD <- D[D$Date == "2/1/2007" | D$Date == "2/2/2007", ]
# fix Date and Time
DD$Time <- strptime(paste(DD$Date, DD$Time, sep = " "), format = "%m/%d/%Y %H:%M:%S") 
DD$Date <- as.Date(DD$Date, format = "%m/%d/%Y")
str(DD)
# Plot the four graphs
png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Graph1
plot(DD$Time, DD$Global_active_power, "l", ylim = c(0, 6), 
     ylab = "Global Active Power", xlab = "", yaxt = "n")
axis(2, yaxp = c(0, 6, 3))
# Graph2
plot(DD$Time, DD$Voltage , "l", ylim = c(234, 246), 
     ylab = "Voltage", xlab = "datetime", yaxt = "n")
axis(2, yaxp = c(234, 246, 3))
# Graph3
plot(DD$Time, DD$Sub_metering_1 , type = "l", col = "black", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
par(new = TRUE)
plot(DD$Time, DD$Sub_metering_2 , type = "l", col = "red", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
par(new = TRUE)
plot(DD$Time, DD$Sub_metering_3 , type = "l", col = "blue", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
axis(2, yaxp = c(0, 30, 3))
title(ylab = "Energy sub metering")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = names(DD)[7:9])
# Graph4
plot(DD$Time, DD$Global_reactive_power, "l", ylim = c(0, 0.5), 
     ylab = "Global_Reactive_Power", xlab = "datetime", yaxt = "n")
axis(2, yaxp = c(0, 0.5, 5))
dev.off()

