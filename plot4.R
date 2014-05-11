
## Read in data
myData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

## Process date and time fields
myData$DateTime <- paste(myData$Date, myData$Time)
myData$DateTime <- strptime(myData$DateTime, "%d/%m/%Y %H:%M:%S")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

## Select the two specific dates and subset data
datesToPlot <- myData$Date == "2007-02-01" | myData$Date == "2007-02-02"
myDataSub <- myData[datesToPlot, ]

## Plot data
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
with(myDataSub, {
    # Subplot 1
    plot(DateTime, Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power")
    
    # Subplot 2
    plot(DateTime, Voltage, type = "l")
    
    # Subplot 3
    plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(DateTime, Sub_metering_1, type = "l", col = "black")
    points(DateTime, Sub_metering_2, type = "l", col = "red")
    points(DateTime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Subplot 4
    plot(DateTime, Global_reactive_power, type = "l")
})

dev.off()
