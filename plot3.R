Plot 3

# Reading, naming and subsetting power consumption data
table <- "household_power_consumption.txt"
power <- read.table(table, header = TRUE,sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dates <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active <- as.numeric(dates$Global_active_power)
sub1 <- as.numeric(dates$Sub_metering_1)
sub2 <- as.numeric(dates$Sub_metering_2)
sub3 <- as.numeric(dates$Sub_metering_3)


# calling the basic plot functions
png("plot3.png")
plot(datetime,sub1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,sub2,type="l", col="red")
lines(datetime,sub3,type="l",col="blue")
legend("topright", lty=1, lwd=2.5, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# annotating graph
title(main="Energy sub-metering")
dev.off()