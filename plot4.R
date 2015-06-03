setwd("~/Documents/workspace/04 Exploratory Data Analysis")

file="household_power_consumption.txt"

df1 <- read.table(file, header=TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df2 <- subset(df1, (df1$Date == "1/2/2007" | df1$Date == "2/2/2007"))
df2$DateTime <- strptime(paste(df2$Date, df2$Time), format = "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", width=480, height=480)

par(mfcol = c(2,2), ps=11)
with(df2, {
        plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
        
        plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black","red","blue"), 
               lwd=1, bty="n")
        
        plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
        
        plot(DateTime, Global_reactive_power, type="l",  xlab="datetime")
        
})


dev.off()

