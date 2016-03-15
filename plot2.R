## Read in the file into a data variable

## Read Data From Working Session Folder
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the data using Date as a factor with level 1/2/2007 and 2/2/2007
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Convert and concatenate Date and Time variable into single Date variable 
data2$Date <- as.Date(as.character(data2$Date), format = "%d/%m/%Y")
data2$Date <- with(data2, as.POSIXct(paste(Date, Time)))

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))

data2$Voltage <- as.numeric(as.character(data2$Voltage))

data2$Global_intensity <- as.numeric(as.character(data2$Global_intensity))

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))

data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))

## Plot 2 - Complete
png(filename = "plot_2.png", width = 480, height = 480, units = "px")
plot(data2$Global_active_power ~ data2$Date, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
