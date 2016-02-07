#
# plot4.R
#
# Household Power Consumption
#
# Quadruple plot
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
png("plot4.png", height=480, width=480);

# Set up 4 quadrant
par(mfrow=c(2,2));

#Draw plot #1
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power");
lines(data$DateTime, data$Global_active_power);

#Draw plot #2
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA);
lines(data$DateTime, data$Voltage);

#Draw plot #3
plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering");
lines(data$DateTime, data$Sub_metering_1, col = 'black');
lines(data$DateTime, data$Sub_metering_2, col = 'red');
lines(data$DateTime, data$Sub_metering_3, col = 'blue');
legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'));

#Draw plot #3
plot(data$DateTime, data$Global_reactive_power, pch=NA, xlab="datetime", ylab="Global_reactive_power");
lines(data$DateTime, data$Global_reactive_power);

# Close device (file) PNG 
dev.off()