# reading data from file
#my_file <- powerCons.txt
Elec_data <- read.delim("powerCons.txt", header = TRUE, sep = ";")
data <- subset(Elec_data, Elec_data$Date %in% c("1/2/2007", "2/2/2007")) 

Global_ActivePower <- as.numeric(as.character(data$Global_active_power))


png("plot1.png", width = 480, height = 480)
# plot 1 
hist(Global_ActivePower, col = "red",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
