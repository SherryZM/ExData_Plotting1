## Please install packages "data.table" first
## read the data(date before "2007-02-03")
library(data.table)
dataraw <- fread("household_power_consumption.txt", nrows = 69516, data.table = F, header = T)
## save the data(date of "2007-02-01" and "2007-02-02")
dataoutcome <- dataraw[66637:69516, ]

## paste the date and the time
datatimeraw <- c(paste(as.character(dataoutcome[, 1]),as.character(dataoutcome[, 2]),sep=" ")) 
## convert the datatime to POSIXct format
datatime <- as.POSIXct(strptime(datatimeraw, format="%d/%m/%Y %H:%M:%S"))

## the data of Global_active_power
GAP <- as.numeric(dataoutcome[, 3])

## the data of Voltage
voltage <- dataoutcome[, 5]

## the data of energy sub_metering
sub_metering1 <- dataoutcome[, 7]
sub_metering2 <- dataoutcome[, 8]
sub_metering3 <- dataoutcome[, 9]

## the data of Global_reactive_power
GRP <- dataoutcome[, 4]

## set the parameter
par(mfrow = c(2, 2))

plot(datatime, GAP, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

plot(datatime, voltage, type = "l", ylab = "Voltage", xlab = "")

plot(datatime, sub_metering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datatime, sub_metering2, type = "l", col = "red", pch=22, lty=1)
lines(datatime, sub_metering3, type = "l", col = "blue", pch=22, lty=1)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.8, col = c("black", "red", "blue"), lty = 1)

plot(datatime, GRP, type = "l", xlab = "", ylab = "Global_reactive_power")

## save the PNG file
dev.copy(png, file = "plot4.png",width =480,height =480)
dev.off()
