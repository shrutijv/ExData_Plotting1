setwd("/Users/shrutijv/Shruti/Study/DataScience/datavisualization/")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data <- data[ which(as.Date(data$Date , format = "%d/%m/%Y") == as.Date("01/02/2007", format = "%d/%m/%Y") | as.Date(data$Date , format = "%d/%m/%Y") == as.Date("02/02/2007", format = "%d/%m/%Y")) ,]


x <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
y1 <- as.numeric(as.character(data$Sub_metering_1))
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))
y <- as.numeric(as.character(data$Global_active_power))
y4 <- as.numeric(as.character(data$Voltage))
Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
	#topleft
	plot(x,y,type ="l", ylab ="Global Active Power (kilowatts)" , xlab ="")
	#topright
	plot(x,y4,type ="l", ylab ="Voltage" , xlab ="datetime")
	#bottomleft
	plot(x,y1,type ="l", ylab ="Energy sub metering" , xlab ="")
	lines(x,y2, col ="Red")
	lines(x, y3, col ="Blue")
	legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col= c(1,2,4), bty = "n")
	#bottomright
	plot(x,Global_reactive_power,type ="l" , xlab ="datetime")
par(mfrow=c(1,1))
dev.off()
