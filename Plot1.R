# Setting working folder #
tPath <- "D:/00-OneDrive/GitHub/ExData_Plotting1"
setwd(tPath)
# Read in the data #
fnm <- "household_power_consumption.txt"
D <- read.table(fnm, header = TRUE, sep = ";", na.strings = "?")
# filter the data #
DD <- D[D$Date == "1/2/2007" | D$Date == "2/2/2007", ]
# Draw Graph and output to a png file #
png("Plot1.png", width = 480, height = 480)
hist(DD$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (killwatts)")
dev.off()

