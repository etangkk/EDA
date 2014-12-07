# Eva Tang

setwd ("C:\\Users\\tangkk\\Documents\\Big Data\\Exploratory Data Analysis\\")

d = as.data.frame(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?"))
data = d[(d$Date == '1/2/2007' | d$Date == '2/2/2007'), ]
data$DateTime = paste(data$Date, data$Time, sep=" ")
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
rm(d)

png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power", ylim=c(0, 1200))
dev.off()