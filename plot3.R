library(sqldf)

setwd("/Users/shrutijv/Shruti/Study/DataScience/datavisualization/")

mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
data <- read.csv2.sql("household_power_consumption.txt",mysql, sep= ";" ,na.strings = "?")

  
x <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
y1 <- as.numeric(as.character(data$Sub_metering_1))
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))

png(filename="plot3.png",width = 480, height = 480)
plot(x,y1,type ="l", ylab ="Energy sub metering" , xlab ="")
lines(x,y2, col ="Red")
lines(x, y3, col ="Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col= c(1,2,4))
dev.off()