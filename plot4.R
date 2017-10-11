# Put the data from file to dataframe
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Processing the date of the data and subset based on date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption <- household_power_consumption[ 
  household_power_consumption$Date >= as.Date("2007-02-01") & 
    household_power_consumption$Date <= as.Date("2007-02-02"), ]

household_power_consumption$datetime <- as.POSIXct(paste(household_power_consumption$Date,household_power_consumption$Time))

# Configure panel and point
par(mfrow=c(2,2), pch = ".")

# Plot chart
with(household_power_consumption, {
  plot(household_power_consumption$datetime,
       household_power_consumption$Global_active_power,
       ylab = "Global Active Power",
       xlab = "")
  lines(household_power_consumption$datetime,
        household_power_consumption$Global_active_power)
  plot(household_power_consumption$datetime,
       household_power_consumption$Voltage,
       ylab = "Voltage",
       xlab = "datetime")
  lines(household_power_consumption$datetime,
        household_power_consumption$Voltage)
  plot(household_power_consumption$datetime,
       household_power_consumption$Sub_metering_1,
       ylab = "Energy sub metering",
       xlab = "")
  lines(household_power_consumption$datetime,
        household_power_consumption$Sub_metering_1,
        col="black")
  lines(household_power_consumption$datetime,
        household_power_consumption$Sub_metering_2,
        col="red")
  lines(household_power_consumption$datetime,
        household_power_consumption$Sub_metering_3,
        col="blue")
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c("black","red","blue"), 
         bty = "n",
         y.intersp = 0.4,
         lwd = c(1,1,1),
         seg.len = 1.5,
         adj = 0)
  plot(household_power_consumption$datetime,
       household_power_consumption$Global_reactive_power,
       ylab = "Global_reactive_power",
       xlab = "datetime")
  lines(household_power_consumption$datetime,
        household_power_consumption$Global_reactive_power)
})

# Export chart to png file
dev.copy(png,'plot4.png')
dev.off()
