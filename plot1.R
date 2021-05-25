#Plot 1
table <- "household_power_consumption.txt"
#Reading, naming and subsetting power consumption data
power <- read.table(table, header = TRUE,sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dates <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

# histogram for plot1
plot1<- as.numeric(dates$Global_active_power)
png("plot1.png")
hist(plot1, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
