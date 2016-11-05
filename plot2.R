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

## the line for Global_active_power ~ datatime
plot(datatime, GAP, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

## save the PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()