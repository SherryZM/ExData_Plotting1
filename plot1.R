## Please install packages "data.table" first
## read the data(date before "2007-02-03")
library(data.table)
dataraw <- fread("household_power_consumption.txt", nrows = 69516, data.table = F, header = T)
## save the data(date of "2007-02-01" and "2007-02-02")
dataoutcome <- dataraw[66637:69516, ]

## the data of Global_active_power
GAP <- as.numeric(dataoutcome[, 3])

## plot the histogram
hist(GAP, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

## save the PNG file
dev.copy(png, file = "plot1.png",width =480,height =480)
dev.off()