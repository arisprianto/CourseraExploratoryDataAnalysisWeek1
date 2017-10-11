# Put the data from file to dataframe
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Processing the date of the data and subset based on date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption <- household_power_consumption[ 
                                  household_power_consumption$Date >= as.Date("2007-02-01") & 
                                  household_power_consumption$Date <= as.Date("2007-02-02"), ]

household_power_consumption$datetime <- as.POSIXct(paste(household_power_consumption$Date,household_power_consumption$Time))

# Create plot chart with dot point
with(household_power_consumption, {
  plot(household_power_consumption$datetime,
       household_power_consumption$Global_active_power,
       ylab = "Global Active Power (kilowatts)",
       xlab = "",
       pch=".")
  # Add line in the chart between the dot point  
  lines(household_power_consumption$datetime,
        household_power_consumption$Global_active_power)})
     

# Export chart to png file
dev.copy(png,'plot2.png')
dev.off()
