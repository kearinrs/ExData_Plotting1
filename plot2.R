#Plot 2
#reading, naming and subsetting data
table <- "household_power_consumption.txt"
power <- read.table(table, header = TRUE,sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dates <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(dates$Date, dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active <- as.numeric(dates$Global_active_power)

png("plot2.png")
plot(datetime,active, type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
