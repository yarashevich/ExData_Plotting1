DT <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE)
DT_F <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007",]
DT_F$Global_active_power <- as.numeric(DT_F$Global_active_power)

png(file = "plot1.png", width = 480, height = 480)

hist(
  DT_F$Global_active_power, 
  col="red", 
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)"
  )

dev.off()