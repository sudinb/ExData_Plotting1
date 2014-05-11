
## Read in data
myData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

## Process date and time fields
myData$DateTime <- paste(myData$Date, myData$Time)
myData$DateTime <- strptime(myData$DateTime, "%d/%m/%Y %H:%M:%S")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

## Select the two specific dates and subset data
datesToPlot <- myData$Date == "2007-02-01" | myData$Date == "2007-02-02"
myDataSub <- myData[datesToPlot, ]

## Plot histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(myDataSub$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()


     