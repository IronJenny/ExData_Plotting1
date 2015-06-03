setwd("~/Documents/workspace/04 Exploratory Data Analysis")

file="household_power_consumption.txt"

df1 <- read.table(file, header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df2 <- subset(df1, (df1$Date == "1/2/2007" | df1$Date == "2/2/2007"))
df2$DateTime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png", width=480, height=480)
plot(df2$DateTime,
     df2$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering", 
     xlab="")
lines(df2$DateTime,
      df2$Sub_metering_2, 
      col="red")
lines(df2$DateTime,
     df2$Sub_metering_3, 
     col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), 
       lwd=1)
dev.off()

