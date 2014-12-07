setwd ("C:\\Users\\tangkk\\Documents\\Big Data\\Exploratory Data Analysis\\")

d = as.data.frame(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?"))
data = d[(d$Date == '1/2/2007' | d$Date == '2/2/2007'), ]
data$DateTime = paste(data$Date, data$Time, sep=" ")
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
rm(d)

png(filename="plot3.png", width=480, height=480, units="px", bg="transparent")
# http://www.statmethods.net/graphs/line.html
color = c("black", "red", "blue")
xrange <- range(data$DateTime)
yrange <- range(data$Sub_metering_1)
plot(xrange, yrange, type="n", ylab="Energy sub metering")
  lines(y=data$Sub_metering_1, x=data$DateTime, col="black")
  lines(y=data$Sub_metering_2, x=data$DateTime, col="red")
  lines(y=data$Sub_metering_3, x=data$DateTime, col="blue")
  legend("topright", col=color, lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()