## Getting full dataset
setwd ("C:/Data Science/Coursera/Work Space/R Program/exploratory-data-analysis/Week 1/")

Plot_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Plot_data$Date <- as.Date(Plot_data$Date, format="%d/%m/%Y")

## Subsetting the data
meow <- subset(Plot_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
hello_ig <- paste(as.Date(meow$Date), meow$Time)
meow$Datetime <- as.POSIXct(hello_ig)

## Plot 3
with(meow, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="./plot3.png", height=480, width=480)
dev.off()