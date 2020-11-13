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
png("Plot2.png", width = 480, height = 480)
plot(DD$Time, DD$Global_active_power, type = "l", ylim = c(0, 6), 
     ylab = "Global Active Power (Kilowatts)", xlab = "", yaxt = "n")
axis(2, yaxp = c(0, 6, 3))
dev.off()

