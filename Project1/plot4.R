setwd ("C:\\Users\\tangkk\\Documents\\Big Data\\Exploratory Data Analysis\\")

d = as.data.frame(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?"))
data = d[(d$Date == '1/2/2007' | d$Date == '2/2/2007'), ]
data$DateTime = paste(data$Date, data$Time, sep=" ")
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
rm(d)

png(filename="plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfrow=c(2, 2))
with (data, {
  plot(y=Global_active_power, x=DateTime, type="l", ylab="Global Active Power", xlab="")
  plot(y=Voltage, x=DateTime, type="l", ylab="Voltage", xlab="datetime")
  plot(xrange, yrange, type="n", ylab="Energy sub metering", xlab="")
  lines(y=data$Sub_metering_1, x=DateTime, col="black")
  lines(y=data$Sub_metering_2, x=DateTime, col="red")
  lines(y=data$Sub_metering_3, x=DateTime, col="blue")
  legend("topright", col=color, lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(y=Global_reactive_power, x=DateTime, type="l", xlab="datetime")
} )
dev.off()