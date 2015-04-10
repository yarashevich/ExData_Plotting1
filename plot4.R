DT <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE)
DT_F <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007",]
DT_F$Global_active_power <- as.numeric(DT_F$Global_active_power)
DT_F$Sub_metering_1 <- as.numeric(DT_F$Sub_metering_1)
DT_F$Sub_metering_2 <- as.numeric(DT_F$Sub_metering_2)
DT_F$Sub_metering_3 <- as.numeric(DT_F$Sub_metering_3)
DT_F$Voltage <- as.numeric(DT_F$Voltage)
DT_F$DateTime <- strptime(paste(DT_F$Date, DT_F$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfcol = c(2,2))

with(DT_F, {
  plot(DateTime, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")

  plot(DateTime, Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2, col = "red", type = "l")
  points(DateTime, Sub_metering_3, col = "blue", type = "l")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

  plot(DateTime, Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()