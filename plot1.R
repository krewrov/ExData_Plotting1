#
# plot1.R
#
# Household Power Consumption
#
# Histogram
#
# Erwin Vorwerk, Feb 2016
#

# Set working directory
setwd("~/Documents/Coursera/2. R Programming")

# Read contents of file into data variable
data <- read.csv("./data/household_power_consumption.txt", sep=";" , 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings='?');

# Convert Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S");

# Only use data from the dates 2007-02-01 an d2007-02-02
data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime)<= ("2007-02-02"));

# Open PNG plot
png("plot1.png", height=480, width=480);

# Draw histogram
hist(data$Global_active_power, col = "red" , xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close device (file) PNG 
dev.off()