## Getting full dataset
setwd ("C:/Data Science/Coursera/Work Space/R Program/exploratory-data-analysis/Week 1/")
Plot_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Plot_data$Date <- as.Date(Plot_data$Date, format="%d/%m/%Y")


## Subsetting the data
meow <- subset(Plot_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
hello_ig <- paste(as.Date(meow$Date), meow$Time)
meow$Datetime <- as.POSIXct(hello_ig)

## Plot 2
plot(meow$Global_active_power~meow$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./plot2.png", height=480, width=480)
dev.off()