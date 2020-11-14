# Setting working folder #
tPath <- "D:/00-OneDrive/GitHub/ExData_Plotting1"
setwd(tPath)
# Read in the data #
fnm <- "household_power_consumption.txt"
D <- read.table(fnm, header = TRUE, sep = ";", na.strings = "?")
# filter the data #
DD <- D[D$Date == "1/2/2007" | D$Date == "2/2/2007", ]
# fix Date and Time
DD$Time <- strptime(paste(DD$Date, DD$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S") 
DD$Date <- as.Date(DD$Date, format = "%m/%d/%Y")
str(DD)
# Plot Graph
png("Plot3.png", width = 480, height = 480)
plot(DD$Time, DD$Sub_metering_1 , type = "l", col = "black", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
par(new = TRUE)
plot(DD$Time, DD$Sub_metering_2 , type = "l", col = "red", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
par(new = TRUE)
plot(DD$Time, DD$Sub_metering_3 , type = "l", col = "blue", ylim = c(0, 40), xlab = "", ylab = "", yaxt = "n")
axis(2, yaxp = c(0, 30, 3))
title(ylab = "Energy sub metering")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(DD)[7:9])
dev.off()

