library(sqldf)

setwd("/Users/shrutijv/Shruti/Study/DataScience/datavisualization/")

mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" 
data <- read.csv2.sql("household_power_consumption.txt",mysql, sep= ";" ,na.strings = "?")

  
x <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
y <- as.numeric(as.character(data$Global_active_power))

png(filename="plot2.png",width = 480, height = 480)
plot(x,y,type ="l", ylab ="Global Active Power (kilowatts)" , xlab ="")
dev.off()