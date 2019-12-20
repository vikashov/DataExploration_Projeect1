Elec_data <- read.delim("powerCons.txt", header = TRUE, sep = ";")
data1 <- subset(Elec_data, Elec_data$Date == "1/2/2007" | Elec_data$Date == "2/2/2007")

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")

sub_meter1 <- as.numeric(as.character(data1$Sub_metering_1))
sub_meter2 <- as.numeric(as.character(data1$Sub_metering_2))
sub_meter3 <- as.numeric(as.character(data1$Sub_metering_3))

Global_ActivePower <- as.numeric(as.character(data1$Global_active_power))
voltagec <- as.numeric(as.character(data1$Voltage))

data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow = c(2,2))

png("plot4.png", width = 480, height = 480)

with(data1,{
  plot(data1$Time,Global_ActivePower,type="l",  xlab="",ylab="Global Active Power")  
  plot(data1$Time,voltagec, type="l",xlab="datetime",ylab="Voltage")
  plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(data1,lines(Time,sub_meter1))
  with(data1,lines(Time,sub_meter2,col="red"))
  with(data1,lines(Time,sub_meter3,col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(data1$Time,Global_ActivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
})
#png("plot4.png", width = 480, height = 480)
dev.off()
