# reading data from file
#my_file <- powerCons.txt
Elec_data <- read.delim("powerCons.txt", header = TRUE, sep = ";")
data1 <- subset(Elec_data, Elec_data$Date == "1/2/2007" | Elec_data$Date == "2/2/2007")

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")

data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

Global_ActivePower <- as.numeric(as.character(data$Global_active_power))
png("plot2.png", width = 480, height = 480)

plot(data1$Time, Global_ActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
