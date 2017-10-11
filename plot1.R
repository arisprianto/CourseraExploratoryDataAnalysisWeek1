# Put the data from file to dataframe
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Processing the date of the data and subset based on date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption <- household_power_consumption[ 
                                  household_power_consumption$Date >= as.Date("2007-02-01") & 
                                  household_power_consumption$Date <= as.Date("2007-02-02"), ]

# Create histogram chart
hist(as.numeric(household_power_consumption$Global_active_power), 
     col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Export chart to png file
dev.copy(png,'plot1.png')
dev.off()
