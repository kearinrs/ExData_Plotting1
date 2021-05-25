#Plot 4

# Reading, naming and subsetting power consumption data
table <- "household_power_consumption.txt"
power <- read.table(table, header = TRUE,sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dates <- power[power$Date %in% c("1/2/2007","2/2/2007"),]


# initiating a composite plot with many graphs
par(mfrow=c(2,2))
active <- as.numeric(dates$Global_active_power)
reactive <- as.numeric(dates$Global_reactive_power)
voltage <- as.numeric(dates$Voltage)
sub1 <- as.numeric(dates$Sub_metering_1)
sub2 <- as.numeric(dates$Sub_metering_2)
sub3 <- as.numeric(dates$Sub_metering_3)


# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
png("plot4.png")
plot(datetime,active,type="l",  xlab="",ylab="Global Active Power")  
plot(datetime,voltage, type="l",xlab="datetime",ylab="Voltage")
plot(datetime,sub1,type="n",xlab="",ylab="Energy sub metering")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(datetime,reactive,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

