setwd("/Users/shrutijv/Shruti/Study/DataScience/datavisualization/")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data <- data[ which(as.Date(data$Date , format = "%d/%m/%Y") == as.Date("01/02/2007", format = "%d/%m/%Y") | as.Date(data$Date , format = "%d/%m/%Y") == as.Date("02/02/2007", format = "%d/%m/%Y")) ,]

x<- as.numeric(as.character(data$Global_active_power))

png(filename="plot1.png",width = 480, height = 480)
hist(x, xlab = "Global Active Power (kilowatts)", ylab = "Frequency" , main = "Global Active Power" , col ="Red")
dev.off()

