DT <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE)
DT_F <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007",]
DT_F$Global_active_power <- as.numeric(DT_F$Global_active_power)
DT_F$DateTime <- strptime(paste(DT_F$Date, DT_F$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

with (DT_F, plot(
              DateTime, 
              Global_active_power,
              type = "l", 
              xlab = "", 
              ylab = "Global Active Power (kilowatts)")
      )

dev.off()