setwd("~/Documents/workspace/04 Exploratory Data Analysis")

file="household_power_consumption.txt"

df1 <- read.table(file, header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

df2 <- subset(df1, (df1$Date == "1/2/2007" | df1$Date == "2/2/2007"))


png(filename = "plot1.png", width=480, height=480)
hist(df2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()